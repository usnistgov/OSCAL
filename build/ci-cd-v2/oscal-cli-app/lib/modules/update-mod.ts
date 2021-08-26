import { spawnSync } from "child_process";
import { getRelease } from '../utils/release_util';

export const updateOscal = async () => {
    const oscalVersion = spawnSync(
        'oscalcli', ['---version'],
        {shell: true, stdio: 'pipe', encoding  : 'utf8'}
    );
    //Get the release of the local version of oscalcli
    const localVersion = oscalVersion.stdout.trim();
    console.log('currentVersion======', localVersion)
    //Get the release of the oscalcli repository
    const release = await getRelease();
    console.log ('release=====', release);
    if (localVersion !== release) {
        spawnSync(
            'npm',
            ['install', `<GIT-USER>/<oscalcli-app>@${release}`],
            {shell: true, stdio: 'inherit'}
        );
    } else {
        console.log(`Oscalcli is up to date with ${localVersion}`);
    }
}