# generated using pypi2nix tool (version: 1.8.1)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -r requirements.txt -V 3
#

{ pkgs ? import <nixpkgs> {}
}:

let

  inherit (pkgs) makeWrapper;
  inherit (pkgs.stdenv.lib) fix' extends inNixShell;

  pythonPackages =
  import "${toString pkgs.path}/pkgs/top-level/python-packages.nix" {
    inherit pkgs;
    inherit (pkgs) stdenv;
    python = pkgs.python3;
    # patching pip so it does not try to remove files when running nix-shell
    overrides =
      self: super: {
        bootstrapped-pip = super.bootstrapped-pip.overrideDerivation (old: {
          patchPhase = old.patchPhase + ''
            sed -i               -e "s|paths_to_remove.remove(auto_confirm)|#paths_to_remove.remove(auto_confirm)|"                -e "s|self.uninstalled = paths_to_remove|#self.uninstalled = paths_to_remove|"                  $out/${pkgs.python35.sitePackages}/pip/req/req_install.py
          '';
        });
      };
  };

  commonBuildInputs = [];
  commonDoCheck = false;

  withPackages = pkgs':
    let
      pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
      interpreter = pythonPackages.buildPythonPackage {
        name = "python3-interpreter";
        buildInputs = [ makeWrapper ] ++ (builtins.attrValues pkgs);
        buildCommand = ''
          mkdir -p $out/bin
          ln -s ${pythonPackages.python.interpreter}               $out/bin/${pythonPackages.python.executable}
          for dep in ${builtins.concatStringsSep " "               (builtins.attrValues pkgs)}; do
            if [ -d "$dep/bin" ]; then
              for prog in "$dep/bin/"*; do
                if [ -f $prog ]; then
                  ln -s $prog $out/bin/`basename $prog`
                fi
              done
            fi
          done
          for prog in "$out/bin/"*; do
            wrapProgram "$prog" --prefix PYTHONPATH : "$PYTHONPATH"
          done
          pushd $out/bin
          ln -s ${pythonPackages.python.executable} python
          ln -s ${pythonPackages.python.executable}               python3
          popd
        '';
        passthru.interpreter = pythonPackages.python;
      };
    in {
      __old = pythonPackages;
      inherit interpreter;
      mkDerivation = pythonPackages.buildPythonPackage;
      packages = pkgs;
      overrideDerivation = drv: f:
        pythonPackages.buildPythonPackage (drv.drvAttrs // f drv.drvAttrs //                                            { meta = drv.meta; });
      withPackages = pkgs'':
        withPackages (pkgs // pkgs'');
    };

  python = withPackages {};

  generated = self: {

    "Click" = python.mkDerivation {
      name = "Click-7.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f8/5c/f60e9d8a1e77005f664b76ff8aeaee5bc05d0a91798afd7f53fc998dbc47/Click-7.0.tar.gz"; sha256 = "5b94b49521f6456670fdb30cd82a4eca9412788a93fa6dd6df72c94d5a8ff2d7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://palletsprojects.com/p/click/";
        license = licenses.bsdOriginal;
        description = "Composable command line interface toolkit";
      };
    };



    "Jinja2" = python.mkDerivation {
      name = "Jinja2-2.10.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/93/ea/d884a06f8c7f9b7afbc8138b762e80479fb17aedbbe2b06515a12de9378d/Jinja2-2.10.1.tar.gz"; sha256 = "065c4f02ebe7f7cf559e49ee5a95fb800a9e4528727aec6f24402a5374c65013"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."MarkupSafe"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://jinja.pocoo.org/";
        license = licenses.bsdOriginal;
        description = "A small but fast and easy to use stand-alone template engine written in pure python.";
      };
    };



    "Markdown" = python.mkDerivation {
      name = "Markdown-3.1.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/ac/df/0ae25a9fd5bb528fe3c65af7143708160aa3b47970d5272003a1ad5c03c6/Markdown-3.1.1.tar.gz"; sha256 = "2e50876bcdd74517e7b71f3e7a76102050edec255b3983403f1a63e7c8a41e7a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."PyYAML"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://Python-Markdown.github.io/";
        license = licenses.bsdOriginal;
        description = "Python implementation of Markdown.";
      };
    };



    "MarkupSafe" = python.mkDerivation {
      name = "MarkupSafe-1.1.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094/MarkupSafe-1.1.1.tar.gz"; sha256 = "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://palletsprojects.com/p/markupsafe/";
        license = licenses.bsdOriginal;
        description = "Safely add untrusted strings to HTML/XML markup.";
      };
    };



    "PyYAML" = python.mkDerivation {
      name = "PyYAML-5.1.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/e3/e8/b3212641ee2718d556df0f23f78de8303f068fe29cdaa7a91018849582fe/PyYAML-5.1.2.tar.gz"; sha256 = "01adf0b6c6f61bd11af6e10ca52b7d4057dd0be0343eb9283c878cf3af56aee4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/yaml/pyyaml";
        license = licenses.mit;
        description = "YAML parser and emitter for Python";
      };
    };



    "Pygments" = python.mkDerivation {
      name = "Pygments-2.4.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/7e/ae/26808275fc76bf2832deb10d3a3ed3107bc4de01b85dcccbe525f2cd6d1e/Pygments-2.4.2.tar.gz"; sha256 = "881c4c157e45f30af185c1ffe8d549d48ac9127433f2c380c24b84572ad66297"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pygments.org/";
        license = licenses.bsdOriginal;
        description = "Pygments is a syntax highlighting package written in Python.";
      };
    };



    "appdirs" = python.mkDerivation {
      name = "appdirs-1.4.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/48/69/d87c60746b393309ca30761f8e2b49473d43450b150cb08f3c6df5c11be5/appdirs-1.4.3.tar.gz"; sha256 = "9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b372d92"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/ActiveState/appdirs";
        license = licenses.mit;
        description = "A small Python module for determining appropriate platform-specific dirs, e.g. a \"user data dir\".";
      };
    };



    "backports-abc" = python.mkDerivation {
      name = "backports-abc-0.5";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/68/3c/1317a9113c377d1e33711ca8de1e80afbaf4a3c950dd0edfaf61f9bfe6d8/backports_abc-0.5.tar.gz"; sha256 = "033be54514a03e255df75c5aee8f9e672f663f93abb723444caec8fe43437bde"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/cython/backports_abc";
        license = licenses.psfl;
        description = "A backport of recent additions to the 'collections.abc' module.";
      };
    };



    "htmlmin" = python.mkDerivation {
      name = "htmlmin-0.1.12";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/b3/e7/fcd59e12169de19f0131ff2812077f964c6b960e7c09804d30a7bf2ab461/htmlmin-0.1.12.tar.gz"; sha256 = "50c1ef4630374a5d723900096a961cff426dff46b48f34d194a81bbe14eca178"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://htmlmin.readthedocs.io/en/latest/";
        license = licenses.bsdOriginal;
        description = "An HTML Minifier";
      };
    };



    "jsmin" = python.mkDerivation {
      name = "jsmin-2.2.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/17/73/615d1267a82ed26cd7c124108c3c61169d8e40c36d393883eaee3a561852/jsmin-2.2.2.tar.gz"; sha256 = "b6df99b2cd1c75d9d342e4335b535789b8da9107ec748212706ef7bbe5c2553b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/tikitu/jsmin/";
        license = licenses.mit;
        description = "JavaScript minifier.";
      };
    };



    "livereload" = python.mkDerivation {
      name = "livereload-2.6.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/27/26/85ba3851d2e4905be7d2d41082adca833182bb1d7de9dfc7f623383d36e1/livereload-2.6.1.tar.gz"; sha256 = "89254f78d7529d7ea0a3417d224c34287ebfe266b05e67e51facaf82c27f0f66"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
      self."tornado"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/lepture/python-livereload";
        license = licenses.bsdOriginal;
        description = "Python LiveReload is an awesome tool for web developers";
      };
    };



    "mkdocs" = python.mkDerivation {
      name = "mkdocs-1.0.4";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/7e/58/1ff1580aab41d6247455495a9b5ff649b94cbfc22d63682dc42a5964080e/mkdocs-1.0.4.tar.gz"; sha256 = "17d34329aad75d5de604b9ed4e31df3a4d235afefdc46ce7b1964fddb2e1e939"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Click"
      self."Jinja2"
      self."Markdown"
      self."PyYAML"
      self."livereload"
      self."tornado"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://www.mkdocs.org";
        license = licenses.bsdOriginal;
        description = "Project documentation with Markdown.";
      };
    };



    "mkdocs-material" = python.mkDerivation {
      name = "mkdocs-material-4.4.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/d4/92/d4b9379faaa1d020fa8aab7637c53ab32d33cfd8a87dfa6d902721b91b6d/mkdocs-material-4.4.2.tar.gz"; sha256 = "d3e641f634227ce113ebdde1df0a0e0b1eba1d3f1da35344d68095b4270407b2"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Pygments"
      self."mkdocs"
      self."mkdocs-minify-plugin"
      self."pymdown-extensions"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://squidfunk.github.io/mkdocs-material/";
        license = licenses.mit;
        description = "A Material Design theme for MkDocs";
      };
    };



    "mkdocs-minify-plugin" = python.mkDerivation {
      name = "mkdocs-minify-plugin-0.2.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/66/fe/47e0acd1df33a289a075af252f3d7d65fb8acec425f5fac12493669c6828/mkdocs-minify-plugin-0.2.1.tar.gz"; sha256 = "3000a5069dd0f42f56a8aaf7fd5ea1222c67487949617e39585d6b6434b074b6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."htmlmin"
      self."jsmin"
      self."mkdocs"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/byrnereese/mkdocs-minify-plugin";
        license = licenses.mit;
        description = "An MkDocs plugin to minify HTML and/or JS files prior to being written to disk";
      };
    };



    "packaging" = python.mkDerivation {
      name = "packaging-19.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/5a/2f/449ded84226d0e2fda8da9252e5ee7731bdf14cd338f622dfcd9934e0377/packaging-19.2.tar.gz"; sha256 = "28b924174df7a2fa32c1953825ff29c61e2f5e082343165438812f00d3a7fc47"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pyparsing"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pypa/packaging";
        license = licenses.bsdOriginal;
        description = "Core utilities for Python packages";
      };
    };



    "pep562" = python.mkDerivation {
      name = "pep562-1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/98/46/048232af31a939b3c0e363418faa12f4cc0e144d00cebce6ec9ff5d0f06b/pep562-1.0.tar.gz"; sha256 = "58cb1cc9ee63d93e62b4905a50357618d526d289919814bea1f0da8f53b79395"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/facelessuser/pep562";
        license = licenses.mit;
        description = "Backport of PEP 562.";
      };
    };



    "pymdown-extensions" = python.mkDerivation {
      name = "pymdown-extensions-6.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/3b/95/da9956789d5a1959f72b655a416e1e0726372d454b58ab7fc50807e8d313/pymdown-extensions-6.1.tar.gz"; sha256 = "960486dea995f1759dfd517aa140b3d851cd7b44d4c48d276fd2c74fc4e1bce9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Markdown"
      self."pep562"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/facelessuser/pymdown-extensions";
        license = licenses.mit;
        description = "Extension pack for Python Markdown.";
      };
    };



    "pyparsing" = python.mkDerivation {
      name = "pyparsing-2.4.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/7e/24/eaa8d7003aee23eda270099eeec754d7bf4399f75c6a011ef948304f66a2/pyparsing-2.4.2.tar.gz"; sha256 = "6f98a7b9397e206d78cc01df10131398f1c8b8510a2f4d97d9abd82e1aacdd80"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pyparsing/pyparsing/";
        license = licenses.mit;
        description = "Python parsing module";
      };
    };



    "singledispatch" = python.mkDerivation {
      name = "singledispatch-3.4.0.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/d9/e9/513ad8dc17210db12cb14f2d4d190d618fb87dd38814203ea71c87ba5b68/singledispatch-3.4.0.3.tar.gz"; sha256 = "5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e3c2b9c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.python.org/3/library/functools.html#functools.singledispatch";
        license = licenses.mit;
        description = "This library brings functools.singledispatch from Python 3.4 to Python 2.6-3.3.";
      };
    };



    "six" = python.mkDerivation {
      name = "six-1.12.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/dd/bf/4138e7bfb757de47d1f4b6994648ec67a51efe58fa907c1e11e350cddfca/six-1.12.0.tar.gz"; sha256 = "d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/benjaminp/six";
        license = licenses.mit;
        description = "Python 2 and 3 compatibility utilities";
      };
    };



    "tornado" = python.mkDerivation {
      name = "tornado-6.0.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/30/78/2d2823598496127b21423baffaa186b668f73cd91887fcef78b6eade136b/tornado-6.0.3.tar.gz"; sha256 = "c845db36ba616912074c5b1ee897f8e0124df269468f25e4fe21fe72f6edd7a9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.tornadoweb.org/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Tornado is a Python web framework and asynchronous networking library, originally developed at FriendFeed.";
      };
    };

  };
  localOverridesFile = ./requirements_override.nix;
  overrides = import localOverridesFile { inherit pkgs python; };
  commonOverrides = [

  ];
  allOverrides =
    (if (builtins.pathExists localOverridesFile)
     then [overrides] else [] ) ++ commonOverrides;

in python.withPackages
   (fix' (pkgs.lib.fold
            extends
            generated
            allOverrides
         )
   )