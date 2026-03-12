---
title: AIL Project features
permalink: /features
layout: info
---

<div class="features-page">
  <section class="features-hero">
    <p class="features-eyebrow">Threat Intelligence Platform</p>
    <h1>AIL Project features</h1>
    <p class="features-intro">AIL helps analysts discover, correlate, and monitor valuable intelligence from unstructured and structured sources at scale.</p>
  </section>

  <section>
    <h2>Screenshots</h2>
    <div class="features-screenshot-grid">
      <img src="https://www.ail-project.org/assets/img/ail-new.png" alt="AIL interface overview">
      <img src="https://www.ail-project.org/assets/img/ail-new2.png" alt="AIL dashboard widgets">
    </div>
  </section>

  <section class="feature-section">
    <h2>Core features</h2>
    <ul class="feature-list">
      <li>Modular architecture to handle streams of unstructured or structured information</li>
      <li>Default support for external ZMQ feeds, such as provided by CIRCL or other providers</li>
      <li>Multiple feed support</li>
      <li>Each module can process and reprocess the information already processed by AIL</li>
      <li>Detecting and extracting URLs including their geographical location (e.g. IP address location)</li>
      <li>Extracting and validating potential leaks of credit card numbers, credentials, and other sensitive data</li>
      <li>Extracting and validating leaked email addresses, including DNS MX validation</li>
      <li>Module for extracting Tor .onion addresses (to be further processed for analysis)</li>
      <li>Keep tracks of duplicates (and diffing between each duplicate found)</li>
      <li>Extracting and validating potential hostnames (e.g. to feed Passive DNS systems)</li>
      <li>A full-text indexer module to index unstructured information</li>
      <li>Statistics on modules and web</li>
      <li>Real-time modules manager in terminal</li>
      <li>Global sentiment analysis for each providers based on nltk vader module</li>
      <li>Terms, set of terms, regex and YARA tracking and occurrence</li>
      <li>Extended tracker to find potential typo-squatting domains using <a href="https://github.com/ail-project/ail-typo-squatting">ail-typo-squatting</a></li>
      <li>Many more modules for extracting phone numbers, credentials and others</li>
      <li>Alerting to <a href="https://github.com/MISP/MISP">MISP</a> to share found leaks within a threat intelligence platform using <a href="https://www.misp-project.org/objects.html#_ail_leak">MISP standard</a></li>
      <li>Detect and decode encoded files (Base64, hex encoded or custom decoding schemes) and store files</li>
      <li>Detect Amazon AWS and Google API keys</li>
      <li>Detect Bitcoin address and Bitcoin private keys and correlation with additional Bitcoin addresses</li>
      <li>Detect private keys, certificates and keys (including SSH and OpenVPN)</li>
      <li>Detect IBAN bank accounts</li>
      <li>Tagging system with <a href="https://github.com/MISP/misp-galaxy">MISP Galaxy</a> and <a href="https://github.com/MISP/misp-taxonomies">MISP Taxonomies</a> tags</li>
      <li>UI paste submission</li>
      <li>Create events on <a href="https://github.com/MISP/MISP">MISP</a> and cases on <a href="https://github.com/TheHive-Project/TheHive">The Hive</a></li>
      <li>Automatic paste export at detection on <a href="https://github.com/MISP/MISP">MISP</a> (events) and <a href="https://github.com/TheHive-Project/TheHive">The Hive</a> (alerts) on selected tags</li>
      <li>Extracted and decoded files can be searched by date range, file type (mime-type) and encoding discovered</li>
      <li>Graph relationships between decoded files (hashes), similar PGP UIDs and addresses of cryptocurrencies</li>
      <li>Tor hidden services crawler to crawl and parse output</li>
      <li>Tor onion availability is monitored to detect up and down of hidden services</li>
      <li>Browser hidden services are captured and integrated in the analysed output, including a blurring screenshot interface</li>
      <li>Tor hidden services are part of the standard framework, all AIL modules are available to crawled hidden services</li>
      <li>Generic web crawler to trigger crawling on demand or at regular interval URL or Tor hidden services</li>
      <li>An advanced detection engine per keyword supporting words, sets, regular expressions and <a href="https://github.com/ail-project/ail-yara-rules">YARA rules</a></li>
      <li>YARA retro-hunting to perform searches on collected items</li>
      <li>AIL synchronisation features to sync with other AIL instances</li>
    </ul>
  </section>

  <section class="feature-section">
    <h2>Recent features introduced</h2>
    <ul class="feature-list feature-list-highlight">
      <li>Unified search interface with best-match/most-recent sorting and integrated date filtering</li>
      <li>Chat Explorer with Discord, Telegram, and Matrix ingestion support, including replies, forwarded metadata, threads, subchannels, and message relationships</li>
      <li>Integrated translation workflows for chats and multilingual analysis improvements</li>
      <li>Built-in YARA editor (CodeMirror) for creating and managing rules directly in AIL</li>
      <li>Image and screenshot intelligence improvements, including AI-generated descriptions and better unsafe-content handling/tagging</li>
      <li>Expanded OCR and QR extraction capabilities, including improved correlation and support for inverted QR codes</li>
      <li>Full PDF processing pipeline with metadata extraction, translation support, and PDF-to-Markdown content extraction</li>
      <li>Passive SSH integration to correlate SSH keys with IPs, domains, and onion services for infrastructure analysis/deanonymization</li>
      <li>I2P crawling support (in addition to Tor/web crawling), with improved crawler stability and capture import workflows</li>
      <li>New investigation workflow improvements (investigation statuses, direct-correlation prioritization, and tracker-to-retro-hunt workflow)</li>
      <li>Organization-aware access controls and stronger account security with 2FA (TOTP/HOTP)</li>
      <li>Extended mail and username search capabilities with improved performance and pagination</li>
    </ul>
  </section>

  <section>
    <h2>Processing overview</h2>
    <p class="features-intro">AIL provides a modular approach with different Python modules in charge of the various features. Modules can be plugged and started live to allow distribution of load accross multi processors.</p>
    <figure class="feature-figure">
      <img src="https://www.ail-project.org/assets/img/graph.svg" alt="AIL processing graph overview">
    </figure>
  </section>
</div>
