pragma solidity ^0.4.23;

/**
 * @title Curriculum vitae definition
 * @author Hai Lu (luhonghai@gmail.com)
 * @dev To define struct of available object on application
*/

library CurriculumVitae {
    /**
     * @dev Basic information of CV owner
     */
    struct BasicInformation {
        // If it is not visible, only CV owner can view this data
        bool isVisible;
        // Full name of CV owner
        string fullName;
        // Avatar URL
        string avatar;
        // Using gravatar service or not. If value = true, then using email to display avatar
        bool useGravatar;
    }

    /**
     * @dev Personal information of CV owner
     */
    struct PersonalInformation {
        // If it is not visible, only CV owner can view this data
        bool isVisible;
        // Phone number
        string phoneNumber;
        // Date of birth
        string dob;
        // Full address
        string fullAddress;
        // Email address
        string email;
    }

    /**
     * @dev Related website. It can be personal website, social network URL ...
     */
    struct Website {
        // If it is not visible, only CV owner can view this data
        bool isVisible;
        // Name of website
        string name;
        // URL to website
        string url;
    }

    /**
     * @dev Skill. eg: Marketing, Mobile development, Javascript, Java ...
     */
    struct Skill {
        // If it is not visible, only CV owner can view this data
        bool isVisible;
        // Name of skill
        string name;
        // Proficiency level, value from 1 to 10
        uint proficiency;
    }

    /**
     * @dev Experience, the working history
     */
    struct Experience {
        // If it is not visible, only CV owner can view this data
        bool isVisible;
        // Job title
        string title;
        // Company name
        string company;
        // Location
        string location;
        // Start from date. Format mm/yyyy
        string fromDate;
        // Finish at date. Leave empty if still in present. Format mm/yyyy
        string toDate;
        // Description
        string description;
    }

    /**
     * @dev Education, school
     */
    struct Education {
        // If it is not visible, only CV owner can view this data
        bool isVisible;
        // School name
        string school;
        // Degree
        string degree;
        // Field of study
        string fieldOfStudy;
        // Grade
        string grade;
        // Start from date. Format mm/yyyy
        string fromDate;
        // Finish at date. Leave empty if still in present. Format mm/yyyy
        string toDate;
        // Description
        string description;
    }

    /**
     * @dev Language. eg: English, Chinese ...
     */
    struct Language {
        // If it is not visible, only CV owner can view this data
        bool isVisible;
        // Language name
        string language;
        // Proficiency level. From 1 to 10
        uint proficiency;
    }

    /**
     * @dev Project
     */
    struct Project {
        // If it is not visible, only CV owner can view this data
        bool isVisible;
        // Project name
        string name;
        // Start from date. Format mm/yyyy
        string fromDate;
        // Finish at date. Leave empty if still in present. Format mm/yyyy
        string toDate;
        // URL to this project if have
        string url;
        // Description
        string description;

    }

    /**
     * @dev Certification. eg: from Udemy, Coursera ...
     */
    struct Certification {
        // If it is not visible, only CV owner can view this data
        bool isVisible;
        // Name of certification
        string name;
        // Authority of certification. Eg: Udemy, Coursera ...
        string authority;
        // License number
        string licenseNumber;
        // Start from date. Format mm/yyyy
        string fromDate;
        // Finish at date. Leave empty if still in present. Format mm/yyyy
        string toDate;
        // URL to certification if have
        string url;
    }

    /**
     * @dev Store list of websites and its indexes
     */
    struct Websites {
        // If it is not visible, only CV owner can view this data
        bool isVisible;
        // Mapping of index to object
        mapping (uint256 => Website) map;
        // Mapping of index to status of index. True: exist, false: not exist
        mapping (uint256 => bool) indexes;
    }

    /**
     * @dev Store list of skills and its indexes
     */
    struct Skills {
        // If it is not visible, only CV owner can view this data
        bool isVisible;
        // Mapping of index to object
        mapping (uint256 => Skill) map;
        // Mapping of index to status of index. True: exist, false: not exist
        mapping (uint256 => bool) indexes;
    }

    /**
     * @dev Store list of experiences and its indexes
     */
    struct Experiences {
        // If it is not visible, only CV owner can view this data
        bool isVisible;
        // Mapping of index to object
        mapping (uint256 => Experience) map;
        // Mapping of index to status of index. True: exist, false: not exist
        mapping (uint256 => bool) indexes;
    }

    /**
     * @dev Store list of educations and its indexes
     */
    struct Educations {
        // If it is not visible, only CV owner can view this data
        bool isVisible;
        // Mapping of index to object
        mapping (uint256 => Education) map;
        // Mapping of index to status of index. True: exist, false: not exist
        mapping (uint256 => bool) indexes;
    }

    /**
     * @dev Store list of languages and its indexes
     */
    struct Languages {
        // If it is not visible, only CV owner can view this data
        bool isVisible;
        // Mapping of index to object
        mapping (uint256 => Language) map;
        // Mapping of index to status of index. True: exist, false: not exist
        mapping (uint256 => bool) indexes;
    }

    /**
     * @dev Store list of projects and its indexes
     */
    struct Projects {
        // If it is not visible, only CV owner can view this data
        bool isVisible;
        // Mapping of index to object
        mapping (uint256 => Project) map;
        // Mapping of index to status of index. True: exist, false: not exist
        mapping (uint256 => bool) indexes;
    }

    /**
     * @dev Store list of certifications and its indexes
     */
    struct Certifications {
        // If it is not visible, only CV owner can view this data
        bool isVisible;
        // Mapping of index to object
        mapping (uint256 => Certification) map;
        // Mapping of index to status of index. True: exist, false: not exist
        mapping (uint256 => bool) indexes;
    }

    /**
     * @dev Curriculum vitae
     */
    struct CurriculumVitae {
        // If it is not visible, only CV owner can view this data
        bool isVisible;
        // Short description
        string shortDescription;
        // Long description
        string longDescription;
        // Basic information
        BasicInformation basicInfo;
        // Personal information
        PersonalInformation personalInfo;
        // Skills of CV owner
        Skills skills;
        // Experiences of CV owner
        Experiences experiences;
        // Educations of CV owner
        Educations educations;
        // Languages of CV owner
        Languages languages;
        // Projects of CV owner
        Projects projects;
        // Certifications of CV owner
        Certifications certifications;
        // Websites of CV owner
        Websites websites;
        // Deal with mapping, CV is exist or not
        bool isExist;
    }

    /**
     * @dev Generate unique identifier. Using for create ID of each record on storage
     * @dev ref https://ethereum.stackexchange.com/questions/9965/how-to-generate-a-unique-identifier-in-solidity
     * @param addr address
     * @return uniqueId unique identifier on uint256
     */
    function generateUniqueId(address addr) public view returns (uint256 uniqueId) {
        return uint256(keccak256(addr, blockhash(block.number - 1)));
    }
}