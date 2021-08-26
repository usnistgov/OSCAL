import fetch from 'node-fetch';

export const getRelease = async () => {
    const url = 'https://api.github.com/repos/usnistgov/OSCAL/releases/latest'
    const response = await fetch(url);
    const data = await response.json();
    const latestRelease = data.tag_name;
//Gets latest oscalcli github release
    return latestRelease.substring(1);
}

// oscalcli --version
// getRelease();