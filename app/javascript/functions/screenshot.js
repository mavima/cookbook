// const screenshot = () => {

//   const CDP = require('chrome-remote-interface');
//   const fs = require('fs');

//   CDP({
//     host: 'localhost',
//     port: 9222,
//   }, async client => {
//     const {Page} = client;

//     await Page.enable();
//     let {data} = await Page.captureScreenshot({
//       format: png
//     });

//     fs.writeFile('screenshot.png', data, 'base64', e => console.log(e));

//     await client.close();
// });

// }

// export { screenshot }
