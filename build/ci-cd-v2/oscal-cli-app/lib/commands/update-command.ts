import { updateOscal } from '../modules/update-mod';

export const command = 'update'
export const desc = 'Usage: oscalcli update'
export const handler = async () => {
    await updateOscal();
}