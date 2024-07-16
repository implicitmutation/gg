const fs = require('fs');
const { execSync } = require('child_process');

const uuid = execSync('uuidgen').toString().trim();
const configPath = process.env.HOME + '/.config/configstore/@genkit-ai/tools-common.json';
const dir = configPath.substring(0, configPath.lastIndexOf('/'));

if (!fs.existsSync(dir)) {
  fs.mkdirSync(dir, { recursive: true });
}

fs.writeFileSync(configPath, JSON.stringify({
  "analytics_notification": true,
  "genkit-tools-ga-id": uuid
}));