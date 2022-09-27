const { getMonDefByEng } = require('./dynamo')

const getMnDef = async (word) => {
    console.log('word :>> ', word);
    const mnData = await getMonDefByEng(word);
    console.log('mnData :>> ', mnData);
    const mnDef = mnData["Item"]["mn"]
    return mnDef ? mnDef : ""
};

module.exports = {
    getMnDef
};