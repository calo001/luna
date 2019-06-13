<div align="center">
  <span align="center"> <img height="70" class="center" src="https://github.com/calo001/luna/blob/master/data/images/com.github.calo001.luna.png" alt="Icon"></span>
  <h1 align="center">Luna</h1>
  <h3 align="center">An amazing calendar widget </h3>
</div>

<br/>

<p align="center">
    <a href="https://appcenter.elementary.io/com.github.calo001.luna">
        <img src="https://appcenter.elementary.io/badge.svg">
    </a>
</p>

<p align="center">
  <a href="https://github.com/calo001/luna">
    <img src="https://img.shields.io/badge/Version-1.1.3-orange.svg">
  </a>
  <a href="https://github.com/calo001/luna/blob/master/LICENSE.md">
    <img src="https://img.shields.io/badge/License-GPL%20v3-blue.svg">
  </a>
  <a href="https://travis-ci.org/calo001/luna">
    <img src="https://travis-ci.org/calo001/luna.svg?branch=master">
  </a>
</p>

<p align="center">
    <img  src="https://github.com/calo001/luna/blob/master/data/images/screenshot_1.png" alt="Screenshot"> <br>
  <a href="https://github.com/calo001/luna/issues/new"> Report a problem! </a>
</p>

## Installation

### Dependencies
These dependencies must be present before building:
 - `meson`
 - `valac`
 - `debhelper`
 - `libgranite-dev`
 - `libgtk-3-dev`


Use the App script to simplify installation by running `./app install-deps`
 
 ### Building

```
git clone https://github.com/calo001/luna.git com.github.calo001.luna && cd com.github.calo001.luna
./app install-deps && ./app install
```

### Deconstruct

```
./app uninstall
```

### Development

Luna includes a script to simplify the development process. This script can be accessed in the main project directory through `./app`.

```
Usage:
  ./app [OPTION]

Options:
  clean             Removes build directories (can require sudo)
  generate-i18n     Generates .pot and .po files for i18n (multi-language support)
  install           Builds and installs application to the system (requires sudo)
  install-deps      Installs missing build dependencies
  run               Builds and runs the application
  uninstall         Removes the application from the system (requires sudo)
```

## Support me

If you like the project and would like to fund and contribute to my work, you can do it via Paypal.Me:

<p align="center">
  <a href="https://www.paypal.me/calo001" target="_blank">
    <img src="resources/paypalme.png" alt="Screenshot">
  </a>
</p>

### Translators

* [Rafael C. Nunes](https://github.com/rafaelcn) Brazilian Portuguese
* [Hannes Schulze](https://github.com/hannesschulze) German 
* [NathanBnm](https://github.com/NathanBnm) French


### License

This project is licensed under the AGPL-3.0 License - see the [LICENSE](LICENSE.md) file for details.
