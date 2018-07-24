const CurriculumVitaeStorage = artifacts.require("./CurriculumVitaeStorage.sol");
const Recommendation = artifacts.require("./Recommendation.sol");
const Endorsement = artifacts.require("./Endorsement.sol");
const Definition = artifacts.require("./data/CurriculumVitae.sol");

module.exports = deployer => {
    deployer.deploy(Recommendation);
    deployer.deploy(Endorsement);
    deployer.deploy(Definition);
    deployer.link(Definition, CurriculumVitaeStorage);
    deployer.deploy(CurriculumVitaeStorage);
};