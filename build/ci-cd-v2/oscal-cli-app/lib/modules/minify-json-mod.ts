import fs from 'fs';
import {colorCodes} from '../utils/init';
const {P_END, P_INFO, P_ERROR, P_OK, P_WARN} = colorCodes;
//*********/
//this is the path passed from CLI. 
//ex src/catalog/json/file.name.json 
//output: src/catalog/json/file.name.min.json
export const minifyJson = (file: string) => { 
  const jsonFile = fs.readFileSync(file, 'utf-8');
  const jsonFileContent = JSON.parse(jsonFile);
  const minJson = file.replace('.json', '-min.json');

 //********* */
//  const consoleLog = (format: string) => console.log(`${P_OK}Converted ${file} ' to ${P_END}${minJson}${P_OK}'.${P_END}`);
//****** *
  //echo -e "${P_OK}Converted ${file}' to {P_END}${ minJson}${P_OK}'.${P_END}"

  //console.log('File is:', minJson)
  //**************
  //fs.mkdirSync(`${file}`, { recursive: true });

  //const min_Dir = `${file}/${minJson}`;
  //***************
  //fs.mkdirSync(minJson, { recursive: true });
  fs.writeFileSync(minJson, JSON.stringify(jsonFileContent, null, 0));
  console.log(`${P_OK}Converted '${file}' to '${P_END}${minJson}${P_OK}'.${P_END}`);
};
