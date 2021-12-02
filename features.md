---
title: AIL Project features
permalink: /features
layout: info
---

# Screenshots

![](https://www.ail-project.org/assets/img/ail-new.png)
![](https://www.ail-project.org/assets/img/ail-new2.png)

# Features

* Modular architecture to handle streams of unstructured or structured information
* Default support for external ZMQ feeds, such as provided by CIRCL or other providers
* Multiple feed support
* Each module can process and reprocess the information already processed by AIL
* Detecting and extracting URLs including their geographical location (e.g. IP address location)
* Extracting and validating potential leaks of credit card numbers, credentials, ...
* Extracting and validating leaked email addresses, including DNS MX validation
* Module for extracting Tor .onion addresses (to be further processed for analysis)
* Keep tracks of duplicates (and diffing between each duplicate found)
* Extracting and validating potential hostnames (e.g. to feed Passive DNS systems)
* A full-text indexer module to index unstructured information
* Statistics on modules and web
* Real-time modules manager in terminal
* Global sentiment analysis for each providers based on nltk vader module
* Terms, Set of terms and Regex tracking and occurrence
* Many more modules for extracting phone numbers, credentials and others
* Alerting to [MISP](https://github.com/MISP/MISP) to share found leaks within a threat intelligence platform using [MISP standard](https://www.misp-project.org/objects.html#_ail_leak)
* Detect and decode encoded file (Base64, hex encoded or your own decoding scheme) and store files
* Detect Amazon AWS and Google API keys
* Detect Bitcoin address and Bitcoin private keys and correlation with additional Bitcoin addresses from 
* Detect private keys, certificate, keys (including SSH, OpenVPN)
* Detect IBAN bank accounts
* Tagging system with [MISP Galaxy](https://github.com/MISP/misp-galaxy) and [MISP Taxonomies](https://github.com/MISP/misp-taxonomies) tags
* UI paste submission
* Create events on [MISP](https://github.com/MISP/MISP) and cases on [The Hive](https://github.com/TheHive-Project/TheHive)
* Automatic paste export at detection on [MISP](https://github.com/MISP/MISP) (events) and [The Hive](https://github.com/TheHive-Project/TheHive) (alerts) on selected tags
* Extracted and decoded files can be searched by date range, type of file (mime-type) and encoding discovered
* Graph relationships between decoded file (hashes), similar PGP UIDs and addresses of cryptocurrencies
* Tor hidden services crawler to crawl and parse output
* Tor onion availability is monitored to detect up and down of hidden services
* Browser hidden services are screenshot and integrated in the analysed output including a blurring screenshot interface (to avoid "burning the eyes" of the security analysis with specific content)
* Tor hidden services is part of the standard framework, all the AIL modules are available to the crawled hidden services
* Generic web crawler to trigger crawling on demand or at regular interval URL or Tor hidden services
* An advanced detection engine per keyword supporting words, set, regular expression and [YARA rules](https://github.com/ail-project/ail-yara-rules)
* A YARA retro-hunting to perform searches on collected items
* AIL Synchronisation features to sync with other AIL instances

# Processing overview

AIL provides a modular approach with different Python modules in charge of the various features. Modules are be plugged and started live to allow distribution of load accross multi processors.

![](https://www.ail-project.org/assets/img/graph.svg)
