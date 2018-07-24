pragma solidity ^0.4.23;

import "../data/CurriculumVitae.sol";
import "./ICurriculumVitaeStorage.sol";
import "./BaseStorage.sol";

/**
 * @title Curriculum Vitae Storage
 * @author Hai Lu (luhonghai@gmail.com)
 * @dev Stores and provides setters and getters for curriculum vitae of all users
 *
 * External storage help system to easy to upgrade and maintenance
 * Accessing this storage requires role system
*/

contract CurriculumVitaeStorage is ICurriculumVitaeStorage, BaseStorage {

    using CurriculumVitae for CurriculumVitae.CurriculumVitae;

    mapping (address => CurriculumVitae.CurriculumVitae) storageMap;

    /**
     * @dev Create new CV object if no mapping with address
     * @param _address Account address of CV owner
     */
    modifier createCVIfNotExist(address _address) {
        if (!storageMap[_address].isExist) {
            CurriculumVitae.CurriculumVitae memory cv;
            cv.isExist = true;
            storageMap[_address] = cv;
        }
        _;
    }

    /**
     * @dev Set visible curriculum vitae
     * @param _isVisible Mask curriculum vitae is visible or invisible to public
     */
    function setVisibleCurriculumVitae(bool _isVisible) public {
        storageMap[msg.sender].isVisible = _isVisible;
    }

    /**
     * @dev Save CV description
     * @param _address Account address of CV owner
     * @param _shortDesc Short description of CV
     * @param _longDesc Long description of CV
     */
    function saveDescription(address _address, string _shortDesc, string _longDesc)
            public onlySystemOrCVOwner(_address) {
        storageMap[_address].shortDescription = _shortDesc;
        storageMap[_address].longDescription = _longDesc;
    }

    /**
     * @dev Save CV description
     * @param _shortDesc Short description of CV
     * @param _longDesc Long description of CV
     */
    function saveDescription(string _shortDesc, string _longDesc) public {
        saveDescription(msg.sender, _shortDesc, _longDesc);
    }

    /**
     * @dev Save basic information as separated fields
     * @param _address Account address of CV owner
     * @param _isVisible Mask basic information is visible or invisible to public
     * @param _fullName Full name of CV owner
     * @param _avatar URL to avatar of CV owner
     * @param _useGravatar To using Gravatar service or not
     */
    function saveBasicInformation(address _address,
        bool _isVisible,
        string _fullName,
        string _avatar,
        bool _useGravatar) public onlySystemOrCVOwner(_address) createCVIfNotExist(_address) {
        storageMap[_address].basicInfo = CurriculumVitae.BasicInformation({
            isVisible: _isVisible,
            fullName: _fullName,
            avatar: _avatar,
            useGravatar: _useGravatar
        });
    }

    /**
     * @dev Save basic information as separated fields
     * @param _isVisible Mask basic information is visible or invisible to public
     * @param _fullName Full name of CV owner
     * @param _avatar URL to avatar of CV owner
     * @param _useGravatar To using Gravatar service or not
     */
    function saveBasicInformation(bool _isVisible,
        string _fullName,
        string _avatar,
        bool _useGravatar) public {
        saveBasicInformation(msg.sender, _isVisible, _fullName, _avatar, _useGravatar);
    }

    /**
     * @dev Set visible basic information
     * @param _isVisible Mask basic information is visible or invisible to public
     */
    function setVisibleBasicInformation(bool _isVisible) public {
        storageMap[msg.sender].basicInfo.isVisible = _isVisible;
    }

    /**
     * @dev Save personal information
     * @param _address Account address of CV owner
     * @param _isVisible Mask personal information is visible or invisible to public
     * @param _phoneNumber Phone number of CV owner
     * @param _dob Date of birth of CV owner
     * @param _fullAddress Full address of CV owner
     * @param _email Email address of CV owner
     */
    function savePersonalInformation(address _address,
        bool _isVisible,
        string _phoneNumber,
        string _dob,
        string _fullAddress,
        string _email) public onlySystemOrCVOwner(_address) createCVIfNotExist(_address) {
        storageMap[_address].personalInfo = CurriculumVitae.PersonalInformation({
            isVisible: _isVisible,
            phoneNumber: _phoneNumber,
            dob: _dob,
            fullAddress: _fullAddress,
            email: _email
        });
    }

    /**
     * @dev Save personal information
     * @param _isVisible Mask personal information is visible or invisible to public
     * @param _phoneNumber Phone number of CV owner
     * @param _dob Date of birth of CV owner
     * @param _fullAddress Full address of CV owner
     * @param _email Email address of CV owner
     */
    function savePersonalInformation(bool _isVisible,
        string _phoneNumber,
        string _dob,
        string _fullAddress,
        string _email) public {
        savePersonalInformation(msg.sender, _isVisible, _phoneNumber, _dob, _fullAddress, _email);
    }

    /**
     * @dev Set visible personal information
     * @param _isVisible Mask personal information is visible or invisible to public
     */
    function setVisiblePersonalInformation(bool _isVisible) public {
        storageMap[msg.sender].personalInfo.isVisible = _isVisible;
    }

    /**
     * @dev Add website to CV
     * @param _address Account address of CV owner
     * @param _name Name of website
     * @param _url URL to website
     */
    function addWebsite(address _address, string _name, string _url) public onlySystemOrCVOwner(_address) {

    }

    /**
     * @dev Add website to CV
     * @param _name Name of website
     * @param _url URL to website
     */
    function addWebsite(string _name, string _url) public {
        addWebsite(msg.sender, _name, _url);
    }

    /**
     * @dev Update website
     * @param _id ID of website
     * @param _name Name of website
     * @param _url URL to website
     */
    function updateWebsite(uint256 _id, string _name, string _url) public {

    }

    /**
     * @dev Set visible list of website
     * @param _isVisible Mask list of website is visible or invisible to public
     */
    function setVisibleWebsites(bool _isVisible) public {
        storageMap[msg.sender].websites.isVisible = _isVisible;
    }

    /**
     * @dev Add skill to CV
     * @param _address Account address of CV owner
     * @param _name Name of skill
     * @param _proficiency Proficiency level, value from 1 to 10
     */
    function addSkill(address _address, string _name, uint _proficiency) public onlySystemOrCVOwner(_address) {

    }

    /**
     * @dev Add skill to CV
     * @param _name Name of skill
     * @param _proficiency Proficiency level, value from 1 to 10
     */
    function addSkill(string _name, uint _proficiency) public {
        addSkill(msg.sender, _name, _proficiency);
    }

    /**
     * @dev Update skill
     * @param _id ID of skill
     * @param _name Name of skill
     * @param _proficiency Proficiency level, value from 1 to 10
     */
    function updateSkill(uint256 _id, string _name, string _proficiency) public {

    }

    /**
     * @dev Set visible list of skill
     * @param _isVisible Mask list of skill is visible or invisible to public
     */
    function setVisibleSkills(bool _isVisible) public {
        storageMap[msg.sender].skills.isVisible = _isVisible;
    }

    /**
     * @dev Add experience (working history) to CV
     * @param _address Account address of CV owner
     * @param _title Job title
     * @param _company Company name
     * @param _location Company location
     * @param _fromDate Start from date. Format mm/yyyy
     * @param _toDate Finish at date. Leave empty if still in present. Format mm/yyyy
     * @param _description Description
     */
    function addExperience(address _address,
        string _title,
        string _company,
        string _location,
        string _fromDate,
        string _toDate,
        string _description) public onlySystemOrCVOwner(_address) {

    }

    /**
     * @dev Add experience (working history) to CV
     * @param _title Job title
     * @param _company Company name
     * @param _location Company location
     * @param _fromDate Start from date. Format mm/yyyy
     * @param _toDate Finish at date. Leave empty if still in present. Format mm/yyyy
     * @param _description Description
     */
    function addExperience(string _title,
        string _company,
        string _location,
        string _fromDate,
        string _toDate,
        string _description) public {
        addExperience(msg.sender, _title, _company, _location, _fromDate, _toDate, _description);
    }

    /**
     * @dev Update experience (working history)
     * @param _id ID of experience
     * @param _title Job title
     * @param _company Company name
     * @param _location Company location
     * @param _fromDate Start from date. Format mm/yyyy
     * @param _toDate Finish at date. Leave empty if still in present. Format mm/yyyy
     * @param _description Description
     */
    function updateExperience(uint256 _id,
        string _title,
        string _company,
        string _location,
        string _fromDate,
        string _toDate,
        string _description) public {

    }

    /**
     * @dev Set visible list of experience
     * @param _isVisible Mask list of experience is visible or invisible to public
     */
    function setVisibleExperiences(bool _isVisible) public {
        storageMap[msg.sender].experiences.isVisible = _isVisible;
    }

    /**
     * @dev Add education to CV
     * @param _address Account address of CV owner
     * @param _school School name
     * @param _degree Degree
     * @param _fieldOfStudy Field of study
     * @param _grade Grade
     * @param _fromDate Start from date. Format mm/yyyy
     * @param _toDate Finish at date. Leave empty if still in present. Format mm/yyyy
     * @param _description Description
     */
    function addEducation(address _address,
        string _school,
        string _degree,
        string _fieldOfStudy,
        string _grade,
        string _fromDate,
        string _toDate,
        string _description) public onlySystemOrCVOwner(_address) {

    }

    /**
     * @dev Add education to CV
     * @param _school School name
     * @param _degree Degree
     * @param _fieldOfStudy Field of study
     * @param _grade Grade
     * @param _fromDate Start from date. Format mm/yyyy
     * @param _toDate Finish at date. Leave empty if still in present. Format mm/yyyy
     * @param _description Description
     */
    function addEducation(string _school,
        string _degree,
        string _fieldOfStudy,
        string _grade,
        string _fromDate,
        string _toDate,
        string _description) public {
        addEducation(msg.sender, _school, _degree, _fieldOfStudy, _grade, _fromDate, _toDate, _description);
    }

    /**
     * @dev Update education
     * @param _id ID of education
     * @param _school School name
     * @param _degree Degree
     * @param _fieldOfStudy Field of study
     * @param _grade Grade
     * @param _fromDate Start from date. Format mm/yyyy
     * @param _toDate Finish at date. Leave empty if still in present. Format mm/yyyy
     * @param _description Description
     */
    function updateEducation(uint256 _id,
        string _school,
        string _degree,
        string _fieldOfStudy,
        string _grade,
        string _fromDate,
        string _toDate,
        string _description) public {

    }

    /**
     * @dev Set visible list of education
     * @param _isVisible Mask list of education is visible or invisible to public
     */
    function setVisibleEducations(bool _isVisible) public {
        storageMap[msg.sender].educations.isVisible = _isVisible;
    }

    /**
     * @dev Add language to CV
     * @param _address Account address of CV owner
     * @param _language Name of language
     * @param _proficiency Proficiency level, value from 1 to 10
     */
    function addLanguage(address _address, string _language, uint _proficiency) public onlySystemOrCVOwner(_address) {

    }

    /**
     * @dev Add language to CV
     * @param _language Name of language
     * @param _proficiency Proficiency level, value from 1 to 10
     */
    function addLanguage(string _language, uint _proficiency) public {
        addLanguage(msg.sender, _language, _proficiency);
    }

    /**
     * @dev Update language
     * @param _id ID of language
     * @param _language Name of language
     * @param _proficiency Proficiency level, value from 1 to 10
     */
    function updateLanguage(uint256 _id, string _language, string _proficiency) public {

    }

    /**
     * @dev Set visible list of language
     * @param _isVisible Mask list of language is visible or invisible to public
     */
    function setVisibleLanguages(bool _isVisible) public {
        storageMap[msg.sender].languages.isVisible = _isVisible;
    }

    /**
     * @dev Add project to CV
     * @param _address Account address of CV owner
     * @param _name Project name
     * @param _url URL to this project if exist
     * @param _fromDate Start from date. Format mm/yyyy
     * @param _toDate Finish at date. Leave empty if still in present. Format mm/yyyy
     * @param _description Description
     */
    function addProject(address _address,
        string _name,
        string _url,
        string _fromDate,
        string _toDate,
        string _description) public onlySystemOrCVOwner(_address) {

    }

    /**
     * @dev Add project to CV
     * @param _name Project name
     * @param _url URL to this project if exist
     * @param _fromDate Start from date. Format mm/yyyy
     * @param _toDate Finish at date. Leave empty if still in present. Format mm/yyyy
     * @param _description Description
     */
    function addProject(string _name,
        string _url,
        string _fromDate,
        string _toDate,
        string _description) public {
        addProject(msg.sender, _name, _url, _fromDate, _toDate, _description);
    }

    /**
     * @dev Update project
     * @param _id ID of project
     * @param _name Project name
     * @param _url URL to this project if exist
     * @param _fromDate Start from date. Format mm/yyyy
     * @param _toDate Finish at date. Leave empty if still in present. Format mm/yyyy
     * @param _description Description
     */
    function updateProject(uint256 _id,
        string _name,
        string _url,
        string _fromDate,
        string _toDate,
        string _description) public {

    }

    /**
     * @dev Set visible list of project
     * @param _isVisible Mask list of project is visible or invisible to public
     */
    function setVisibleProjects(bool _isVisible) public {
        storageMap[msg.sender].projects.isVisible = _isVisible;
    }

    /**
     * @dev Add certification to CV
     * @param _address Account address of CV owner
     * @param _name Certification name
     * @param _authority Authority of certification. Eg: Udemy, Coursera ...
     * @param _licenseNumber License number
     * @param _url URL to certification if exist
     * @param _fromDate Start from date. Format mm/yyyy
     * @param _toDate Finish at date. Leave empty if still in present. Format mm/yyyy
     */
    function addCertification(address _address,
        string _name,
        string _authority,
        string _licenseNumber,
        string _url,
        string _fromDate,
        string _toDate) public onlySystemOrCVOwner(_address) {

    }

    /**
     * @dev Add certification to CV
     * @param _name Certification name
     * @param _authority Authority of certification. Eg: Udemy, Coursera ...
     * @param _licenseNumber License number
     * @param _url URL to certification if exist
     * @param _fromDate Start from date. Format mm/yyyy
     * @param _toDate Finish at date. Leave empty if still in present. Format mm/yyyy
     */
    function addCertification(string _name,
        string _authority,
        string _licenseNumber,
        string _url,
        string _fromDate,
        string _toDate) public {
        addCertification(msg.sender, _name, _authority, _licenseNumber, _url, _fromDate, _toDate);
    }

    /**
     * @dev Update certification
     * @param _id ID of certification
     * @param _name Certification name
     * @param _authority Authority of certification. Eg: Udemy, Coursera ...
     * @param _licenseNumber License number
     * @param _url URL to certification if exist
     * @param _fromDate Start from date. Format mm/yyyy
     * @param _toDate Finish at date. Leave empty if still in present. Format mm/yyyy
     */
    function updateCertification(uint256 _id,
        string _name,
        string _authority,
        string _licenseNumber,
        string _url,
        string _fromDate,
        string _toDate) public {

    }

    /**
     * @dev Set visible list of certification
     * @param _isVisible Mask list of certification is visible or invisible to public
     */
    function setVisibleCertifications(bool _isVisible) public {
        storageMap[msg.sender].certifications.isVisible = _isVisible;
    }
}