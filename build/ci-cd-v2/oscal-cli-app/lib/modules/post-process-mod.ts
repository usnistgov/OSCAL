import fs from 'fs';
//import * as YAML from 'json-to-pretty-yaml';
import { validateContent } from './validate-content-mod';
import {colorCodes} from '../utils/init';
const {P_END, P_INFO, P_ERROR, P_OK, P_WARN} = colorCodes;

export const post_process_content = async (
  source_format: any,
  target_format: any,
  target_file: any,
  model: any,
  WORKING_DIR: any,
  OSCAL_DIR: any,
  VERBOSE: boolean,
) => {}
//....IN PROCESS.......