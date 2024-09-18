---
title: AIL Project - FAQ 
permalink: /faq
layout: info
---

# Frequently Asked Questions

## How to size the hardware requirements for AIL? 

The AIL Framework (Analysis Information Leak Framework) is an open-source modular framework designed for analyzing potential information leaks from unstructured data sources like pastes from Pastebin, social media, and other platforms. Running the AIL Framework can be resource-intensive depending on the volume and complexity of data you plan to process. Below are the recommended hardware requirements to install and run the AIL Framework effectively in a small use-case:

### **Minimum Hardware Requirements:**

1. **Processor (CPU):**
   - **Type:** Multi-core processor (64-bit architecture).
   - **Recommendation:** Quad-core CPU or better to handle concurrent processing tasks.

2. **Memory (RAM):**
   - **Minimum:** 8 GB.
   - **Recommended:** 16 GB or more for smoother performance, especially when dealing with large datasets or multiple modules.

3. **Storage:**
   - **Type:** Solid-State Drive (SSD) for faster read/write operations.
   - **Minimum Free Space:** 5 TB.
   - **Recommended:** 10 TB or more, depending on the amount of data you expect to collect and analyze (such as screenshot, HAR archive).

4. **Operating System:**
   - **Type:** Linux-based OS.
   - **Recommended Distributions:** Ubuntu 22.04 LTS or later.
   - **Note:** The framework is primarily developed and tested on Ubuntu-based systems.

5. **Internet Connectivity:**
   - A stable broadband connection for fetching data from online sources and updating modules.

6. **Graphics Processing Unit (GPU):**
   - **Optional:** Not required unless you plan to run LibreTranslate or EasyOCR that leverages GPU acceleration.

### **Additional Recommendations:**

- **Python Environment:**
  - Ensure you have Python 3.7 or higher installed, as the framework and its dependencies rely on Python 3.

- **Dependencies:**
  - Be prepared to install various Python libraries and system packages. Having a system with easy access to package managers like `apt` for Ubuntu will simplify this process.

### **Performance Considerations:**

- **Data Volume:**
  - The more data sources and the higher the data ingestion rate, the more CPU and RAM you'll need.

- **Modules and Features:**
  - Enabling resource-intensive modules (such as doing a lot of pattern matching) will increase hardware demands.

- **Scalability:**
  - For large-scale installation, consider distributed setups or scaling horizontally by adding more machines to handle the storage or the crawling aspects.

### **Summary:**

To ensure optimal performance of the AIL Framework:

- Use a modern multi-core processor (quad-core or better).
- Equip your system with at least 16 GB of RAM.
- Provide ample SSD storage (250 GB or more recommended).
- Run the framework on a Ubuntu-based Linux system.
- Maintain a stable internet connection for data collection and updates.

By meeting these hardware requirements, you'll be well-equipped to install the AIL Framework and utilize its full capabilities for analyzing information leaks effectively.

Regarding the crawling component (Lacus), dedicated hardware is recommended since browsers are launched for each crawl. A similar setup to AIL is suggested, with a specific focus on increasing the number of processor cores. Data storage can be limited to 250 GB of allocated space.
