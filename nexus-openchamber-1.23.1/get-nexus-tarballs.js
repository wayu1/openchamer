const fs = require('fs');
const { execSync } = require('child_process');

console.log("Reading package-lock.json...");
const lockData = JSON.parse(fs.readFileSync('package-lock.json', 'utf8'));
const packages = lockData.packages;

const outDir = 'nexus-deps';
if (!fs.existsSync(outDir)) {
    fs.mkdirSync(outDir);
}

let count = 0;
for (const key in packages) {
    if (!key) continue; // Skip root
    const pkgUrl = packages[key].resolved;

    // Only download if it has a .tgz link
    if (pkgUrl && pkgUrl.endsWith('.tgz')) {
        count++;
        console.log(`[${count}] Downloading for Nexus: ${pkgUrl}`);
        try {
            // Download the tarball directly into the nexus-deps folder
            execSync(`npm pack "${pkgUrl}"`, { cwd: outDir, stdio: 'ignore' });
        } catch (err) {
            console.error(`Failed to download: ${pkgUrl}`);
        }
    }
}
console.log(`\nFinished! All ${count} dependency tarballs are in the 'nexus-deps' folder.`);