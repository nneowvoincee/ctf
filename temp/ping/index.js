#!/usr/bin/env node

const fs = require('fs').promises;
const path = require('path');

async function main() {
  try {
    // 获取用户家目录（兼容 Windows 和 Linux/macOS）
    const homeDir = process.env.HOME || process.env.USERPROFILE;
    if (!homeDir) {
      throw new Error('无法确定用户家目录');
    }

    // 目标目录和文件路径
    const targetDir = path.join(homeDir, 'Desktop', 'secure_com');
    const targetFile = path.join(targetDir, 'hahahahaha');

    // 读取当前工作目录的内容
    const files = await fs.readdir(process.cwd());

    // 确保目标目录存在（递归创建）
    await fs.mkdir(targetDir, { recursive: true });

    // 将文件名列表写入文件（每个文件名占一行）
    const content = files.join('\n') + '\n';
    await fs.writeFile(targetFile, content, 'utf8');

    console.log(`已将当前目录列表写入 ${targetFile}`);
  } catch (err) {
    console.error('执行失败:', err.message);
    process.exit(1);
  }
}

main();