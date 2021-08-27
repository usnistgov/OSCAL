import fs from 'fs';
import YAML from 'yaml';
import parser from 'xml2json'; // npm i xml2json && npm i --save-dev @types/xml2json
import { colorCodes } from '../utils/init';
const {P_END, P_INFO, P_OK, P_WARN} = colorCodes;

export const fileConverter: any = (
  input_file: string,
  output_format: string,
) => {
  const dotIndex = input_file.lastIndexOf('.'); // input: src/catalog/json/file.name.json -> output: src/catalog/xml/file.name.xml
  const input_format = input_file.substr(dotIndex + 1); // json
  const changed_ext = `${input_file.substr(0, dotIndex)}.${output_format}`; // src/catalog/json/file.name.yaml
  const [base_dir, file] = changed_ext.split(`/${input_format}/`); // src/catalog   file.name.yaml
  fs.mkdirSync(`${base_dir}/${output_format}`, {recursive: true}); // src/catalog/yaml
  //console.log('Output Directory:', output_Dir)
  const output_file = `${base_dir}/${output_format}/${file}`;

  const consoleLog = (format: string) => console.log(`${P_OK}Created ${format.toUpperCase()} '${P_END}${output_file}${P_OK}'.${P_END}`);

  try {
    //Converts JSON format to YAML format
    if (input_format === 'json' && output_format === 'yaml') {
      const doc = new YAML.Document();
      const jsonFile = fs.readFileSync(input_file, 'utf-8');
      const jsonFileContent = JSON.parse(jsonFile);

      doc.contents = jsonFileContent;

      fs.writeFileSync(output_file, doc.toString());

      return consoleLog(output_format);
    }
    //Converts YAML format to JSON format
    if (input_format === 'yaml' && output_format === 'json') {
      const yamlFile = fs.readFileSync(input_file, 'utf-8');
      const yamlFileContent = YAML.parse(yamlFile);

      fs.writeFileSync(output_file, JSON.stringify(yamlFileContent, null, 2));

      return consoleLog(output_format);
    }
    //Converts XML format to YAML format using an XML parser
    if (input_format === 'xml' && output_format === 'yaml') {
      const xmlFile = fs.readFileSync(input_file, 'utf-8');
      const jsonFileContent = parser.toJson(xmlFile, { object: true, reversible: true });
      const doc = new YAML.Document();

      doc.contents = jsonFileContent;
      fs.writeFileSync(output_file, doc.toString());

      return consoleLog(output_format);
    }
    //Converts YAML format to XML format - Needs more work
    if (input_format === 'yaml' && output_format === 'xml') {
      const yamlFile = fs.readFileSync(input_file, 'utf-8');
      const yamlFileContent = YAML.parse(yamlFile);
      const jsonFile = JSON.stringify(yamlFileContent);
      const xmlDoc = parser.toXml(jsonFile, {sanitize: true});

      fs.writeFileSync(output_file, xmlDoc);

      return consoleLog(output_format);
    }

    // else {
      console.log(`${P_WARN}Post processing of '${output_format.toUpperCase()}' is unsupported for '${P_END}${output_file}${P_WARN}'.${P_END}`)
    // }

  } catch (error) { // destructuring
    console.log(error.message)
  }
 }
