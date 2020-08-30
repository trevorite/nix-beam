{ stdenv, pkgs, rebar, erlang, debugInfo }:

let
  callElixir = drv: args:
    let builder = pkgs.callPackage ./generic-builder.nix args;
    in pkgs.callPackage drv { mkDerivation = pkgs.makeOverridable builder; };

  versions = [
    {
      version = "1.10.4";
      sha256 = "16j4rmm3ix088fvxhvyjqf1hnfg7wiwa87gml3b2mrwirdycbinv";
      minimumOTPVersion = "21";
    }
    {
      version = "1.9.4";
      sha256 = "1l4318g35y4h0vi2w07ayc3jizw1xc3s7hdb47w6j3iw33y06g6b";
      minimumOTPVersion = "20";
    }
    {
      version = "1.8.2";
      sha256 = "1n77cpcl2b773gmj3m9s24akvj9gph9byqbmj2pvlsmby4aqwckq";
      minimumOTPVersion = "20";
    }
    {
      version = "1.7.4";
      sha256 = "0f8j4pib13kffiihagdwl3xqs3a1ak19qz3z8fpyfxn9dnjiinla";
      minimumOTPVersion = "19";
    }
    {
      version = "1.6.6";
      sha256 = "1wl8rfpw0dxacq4f7xf6wjr8v2ww5691d0cfw9pzw7phd19vazgl";
      minimumOTPVersion = "19";
    }
  ];
in callElixir ({ mkDerivation }:
  mkDerivation {
    version = "1.10.4";
    sha256 = "16j4rmm3ix088fvxhvyjqf1hnfg7wiwa87gml3b2mrwirdycbinv";
    minimumOTPVersion = "21";
  }) {
    inherit rebar erlang debugInfo;
  }
  # in callElixir ./1.10.nix { inherit rebar erlang debugInfo; }
