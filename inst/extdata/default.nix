# This file was generated by the {rix} R package v0.7.0 on 2024-05-21
# with following call:
# >rix(r_ver = "https://github.com/NixOS/nixpkgs/archive/e381a1288138aceda0ac63db32c7be545b446921.tar.gz",
#  > r_pkgs = NULL,
#  > system_pkgs = NULL,
#  > git_pkgs = list(package_name = "rix",
#  > repo_url = "https://github.com/b-rodrigues/rix/",
#  > branch_name = "master",
#  > commit = latest_commit),
#  > ide = "other",
#  > project_path = "../inst/extdata",
#  > overwrite = TRUE,
#  > shell_hook = NULL)
# It uses nixpkgs' revision e381a1288138aceda0ac63db32c7be545b446921 for reproducibility purposes
# which will install R version latest
# Report any issues to https://github.com/b-rodrigues/rix
let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/e381a1288138aceda0ac63db32c7be545b446921.tar.gz") {};
  git_archive_pkgs = [(pkgs.rPackages.buildRPackage {
    name = "rix";
    src = pkgs.fetchgit {
      url = "https://github.com/b-rodrigues/rix/";
      branchName = "master";
      rev = "a31eba5ce2e22f73aeed920bd050b351d68747f5";
      sha256 = "sha256-kMW1+atB54lhIdEE140B02xOmLmojyiiHgo2Xfqza+0=";
    };
    propagatedBuildInputs = builtins.attrValues {
      inherit (pkgs.rPackages) codetools curl httr jsonlite sys;
    };
  }) ];
  system_packages = builtins.attrValues {
  inherit (pkgs) R glibcLocales nix ;
};
  in
  pkgs.mkShell {
    LOCALE_ARCHIVE = if pkgs.system == "x86_64-linux" then  "${pkgs.glibcLocales}/lib/locale/locale-archive" else "";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";

    buildInputs = [ git_archive_pkgs   system_packages  ];
      
  }
