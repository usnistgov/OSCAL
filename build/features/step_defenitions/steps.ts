import { Given, Then, When } from "@cucumber/cucumber";
import chalk from 'chalk';
import { Log } from 'sarif';
import { join, resolve, dirname } from "path";
import { writeFileSync, existsSync, mkdirSync, readFileSync } from "fs";
import { execSync } from "child_process";

const sarifDir = join(process.cwd(), "sarif");

if (!existsSync(sarifDir)) {
  mkdirSync(sarifDir, { recursive: true });
}

function createTerminalLink(location: any) {
  const filePath = location?.physicalLocation?.artifactLocation?.uri || '';
  const lineNumber = location?.physicalLocation?.region?.startLine;
  const columnNumber = location?.physicalLocation?.region?.startColumn;
 
  if (filePath.startsWith('http')) {
    const fileName = filePath.split('/').pop() || filePath;
    const linkText = `${fileName}:${lineNumber}:${columnNumber}`;

    if (filePath.includes('githubusercontent.com')) {
        const [org, repo, ref, ...pathParts] = filePath
            .replace('https://raw.githubusercontent.com/', '')
            .replace('refs/heads/', '')
            .split('/');
            
        const path = pathParts.join('/');
        const githubLink = `https://github.com/${org}/${repo}/blob/${ref}/${path}#L${lineNumber}`;
        return `\u001b]8;;${githubLink}\u0007${linkText}\u001b]8;;\u0007`;
    }
    
    return `\u001b]8;;${filePath}#L${lineNumber}\u0007${linkText}\u001b]8;;\u0007`;
  }

  const fileName = filePath.split('/').pop() || filePath;
  const linkText = `${fileName}:${lineNumber}:${columnNumber}`;
  return linkText;
}

interface LogOptions {
  showFileName: boolean;
}

export function formatSarifOutput(
  log: Log,
  logOptions: LogOptions = { showFileName: true }
) {
  try {
    if (!log || !log.runs || !log.runs[0] || !log.runs[0].results) {
      return chalk.red('Invalid SARIF log format');
    }

    const results = log.runs[0].results;

    const formattedOutput = results
      .filter((x) => x.kind != 'informational' && x.kind !== 'pass')
      .map((result) => {
        const fileDetails = logOptions.showFileName
          ? chalk.gray(
              (result.ruleId || "") +
                " " +
                (result.locations ? createTerminalLink(result.locations[0] as any) : "")
            )
          : chalk.gray(result.ruleId || "");

        if (result.kind == 'fail') {
          return (
            chalk.red.bold("[" + result.level?.toUpperCase() + "] ") +
            fileDetails +
            "\n" +
            chalk.hex("#b89642")(result.message.text)
          );
        } else {
          return chalk.yellow.bold(result.message.text);
        }
      })
      .join('\n\n');

    return formattedOutput;
  } catch (error: any) {
    return chalk.red(`Error processing SARIF log: ${error.message}`);
  }
}

Given('the following directories by type:', function(dataTable:any) {
  this.dirsByType = {};
  dataTable.rows().forEach(([type, paths]:any) => {
    this.dirsByType[type] = paths.split(',');
  });
});

Given('the OSCAL CLI tool is installed', async function() {
  const success = execSync(`npx oscal-cli --version`);
  if (!success) throw new Error('OSCAL CLI not installed');
});

Given('the metaschema directory is {string}', function(dir) {
  this.metaschemaDir = dir;
});

When('I validate {string} content in {string}',{timeout:90000}, async function(type, path) {
  const metaschema = 'oscal_'+type+'_metaschema.xml';
  const metaschemaPath = `${this.metaschemaDir}/${metaschema}`;
  const sarifOutputPath = join(sarifDir, `${type}_validation.sarif`);
  
  try {
    const output = execSync(
      `npx oscal-cli metaschema validate-content ${path} -m ${metaschemaPath} -o ${sarifOutputPath}`,
      {
        stdio: 'pipe',
        encoding: 'utf-8'
      }
    );
    
    const sarifContent = JSON.parse(readFileSync(sarifOutputPath, 'utf-8'));
    this.result = { 
      isValid: true, 
      output,
      sarifLog: sarifContent
    };

  } catch (error:any) {
    let sarifLog = null;
    try {
      sarifLog = JSON.parse(readFileSync(sarifOutputPath, 'utf-8'));
    } catch (e) {
      // SARIF file might not exist or be invalid in case of errors
    }
    
    this.result = { 
      isValid: false,
      error: error.message,
      stderr: error.stderr?.toString(),
      stdout: error.stdout?.toString(),
      sarifLog
    };
  }
});

When('I validate {string} content it passes style guide',{timeout:90000}, async function(type) {
  const metaschema = 'oscal_'+type+'_metaschema.xml';
  const metaschemaPath = `${this.metaschemaDir}/${metaschema}`;
  const styleGuide = `${this.metaschemaDir}/oscal_style_guide.xml`;
  const sarifOutputPath = join(sarifDir, `${type}_style_guide.sarif`);
  
  try {
    const output = execSync(
      `npx oscal-cli metaschema validate ${metaschemaPath} -c ${styleGuide} --disable-schema-validation -o ${sarifOutputPath}`, 
      {
        stdio: 'pipe',
        encoding: 'utf-8'
      }
    );
    
    const sarifContent = JSON.parse(readFileSync(sarifOutputPath, 'utf-8'));
    this.result = { 
      isValid: true, 
      output,
      sarifLog: sarifContent
    };

  } catch (error:any) {
    let sarifLog = null;
    try {
      sarifLog = JSON.parse(readFileSync(sarifOutputPath, 'utf-8'));
    } catch (e) {
      // SARIF file might not exist or be invalid in case of errors
    }

    this.result = { 
      isValid: false,
      error: error.message,
      stderr: error.stderr?.toString(),
      stdout: error.stdout?.toString(),
      sarifLog
    };
  }
});

Then('all validations should pass without errors', function() {
  if (!this.result.isValid) {
    const errors:string[] = [];
    
    if (this.result.sarifLog) {
      errors.push(formatSarifOutput(this.result.sarifLog));
    }
    
    if (this.result.stderr) {
      errors.push(chalk.red(this.result.stderr));
    }
    
    if (this.result.error) {
      errors.push(chalk.red(this.result.error));
    }

    throw new Error(`Validation failed:\n${errors.join('\n\n')}`);
  }
});