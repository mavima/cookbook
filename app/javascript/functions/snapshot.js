

// const snap = () => {

//     // const puppeteer = require ('puppeteer');
//     // const fs = require('fs/promises');
//     const linkpage = document.querySelector('#link_url');
//     const getSnap = document.querySelector('#get-snap');

//     if(getSnap) {
    
//     getSnap.addEventListener('click', () => {

//         console.log("snapsnap");
//         groverSnap = Grover.new(linkpage).to_png
//         // const browser = puppeteer.launch();
//         // const page = browser.newPage();
//         // page.goto(linkpage);
//         // page.screenshot({ path: "yh.png" });
//         // browser.close();
        
//     });
// }


//     // console.log("snapsnap")
//     // const browser = await puppeteer.launch()
//     // const page = await browser.newPage()
//     // await page.goto(linkpage)
//     // await page.screenshot({ path: "yh.png" })
//     // await browser.close()  
    


//     // let clicker = await page.evaluate(() => {
//     //     let el = document.querySelector("body > div.cleanslate.browser-consent > div > div > div > div.sok-consent-modal-buttons > div > button.light-button.accept")
//     //     return el ? el.innerText : ""
//     //   })
//     // if(clicker !== "") {
//     //     await page.click(clicker)
//     // }

//     // for (const photo of photos) {
//     //     const imagepage = await page.goto(photo)
//     //     // create file naming it as the end of the photo url after the last /
//     //     // await fs.writeFile(photo.split("/").pop(8), await imagepage.buffer())
//     //     await fs.writeFile(photo.substr(photo.length - 5), await imagepage.buffer()) 
//     // }
    

// }

// export { snap }