import fs from 'fs';
import {colorCodes} from '../utils/init';
const {P_END, P_ERROR, P_OK} = colorCodes;

export const minifyJson = (inputFilePath: string, filename: any, dir: any) => {
  const jsonFile = fs.readFileSync(inputFilePath, 'utf-8');
  const jsonFileContent = JSON.parse(jsonFile);
  let minFile: string;
  

  if (!dir) {
    const inputFile = inputFilePath.replace(/.*\//g, ''); //   file/jsonfiles/file.json
    if (inputFile === filename) {
      return console.log(`${P_ERROR}Source file "${inputFile}" and target file "${filename}" cannot be the same.${P_END}`);  
    }
    minFile = inputFilePath.replace(inputFile, filename);
  } else {
    if (dir === '.' || dir === './') {
      minFile = `${process.cwd()}/${filename}`;
    } else {
      minFile = dir.startsWith('./')
      ? `${process.cwd()}/${dir.substring(2)}/${filename}`
      : `${process.cwd()}/${dir}/${filename}`;
    }
  }
  fs.writeFileSync(minFile, JSON.stringify(jsonFileContent, null, 0));
  console.log(`${P_OK}Converted '${inputFilePath}' to '${P_END}${minFile}${P_OK}'.${P_END}`);
};

// -d -f
// oscalcli minifyjson file/jsonfiles/file.json -f file-min.json -d path/tojsonfile
// oscalcli minifyjson file/jsonfiles/file.json -o path/jsonpath/file.json

//  ./file.json OR ./path/jsonpath/file.json ---> C:/USER/pwd/./file.json  (Try to prevent this)

// ../file.json  -->  C:/USER/pwd/../file.json (valid)
// file.json  -->  C:/USER/pwd/file.json (valid)