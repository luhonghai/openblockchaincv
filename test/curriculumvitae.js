import 'babel-polyfill';

const CurriculumVitaeStorage = artifacts.require("./CurriculumVitaeStorage.sol");

contract('CurriculumVitaeStorage', accounts => {
  it("can be deployed", async () => {
    const instance = await CurriculumVitaeStorage.deployed();
  });
});