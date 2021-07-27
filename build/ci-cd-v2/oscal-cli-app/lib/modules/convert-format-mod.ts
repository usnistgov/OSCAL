import fs from 'fs';
import YAML from 'yaml';

export const fileConverter: any = (
  input_format: string,
  output_format: string,
  input_file: string,
  output_file: string,
) => {
  if (input_format === 'json' && output_format === 'yaml') {
    const doc = new YAML.Document();
    const jsonFile = fs.readFileSync(input_file, 'utf-8');
    const jsonFileContent = JSON.parse(jsonFile);

    doc.contents = jsonFileContent;

    fs.writeFileSync(output_file, doc.toString());
  }

  if (input_format === 'yaml' && output_format === 'json') {
    const yamlFile = fs.readFileSync(input_format, 'utf-8');
    const yamlFileContent = YAML.parse(yamlFile);

    fs.writeFileSync(output_file, JSON.stringify(yamlFileContent, null, 2));
  }
}