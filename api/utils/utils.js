import { getMonDefByEng } from "./dynamoTools.js"
import axios from 'axios';

const { get } = axios;

export const getMnDef = async (word) => {
    const mnData = await getMonDefByEng(word);
    if (Object.keys(mnData).length === 0) return "Тайлбар олдсонгүй"
    const mnDef = mnData["Item"]["mn"]
    return mnDef ? mnDef : ""
};

export const getDataFromMerriamWebster = async (word) => {
    const learnersDictURL = `https://www.dictionaryapi.com/api/v3/references/learners/json/${word}?key=${process.env.MW_LEARNERS_DICT_KEY}`
    return await get(learnersDictURL);
};

export const buildResponse = async (searchWord, mwRes) => {
    const response = {}
    response["word"] = searchWord
    response["mnDef"] = await getMnDef(searchWord)
    response["enDef"] = mwRes.data[0].shortdef
    response["prs"] = mwRes.data[0].hwi
    response["examples"] = [] //TODO: Examples will be array of strings.
    return response
};