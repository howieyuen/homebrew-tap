# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kusion < Formula
  desc "Codify and deliver intentions to Kubernetes and Clouds"
  homepage "https://github.com/howieyuen/kusion"
  version "0.7.4"
  license "Apache License"

  depends_on "kcl-lang/tap/kclvm"
  depends_on :macos

  on_macos do
    url "https://github.com/howieyuen/kusion/releases/download/v0.7.4/kusion_0.7.4_darwin_amd64.tar.gz", using: CurlDownloadStrategy
    sha256 "d22c374d52867d802381db1e60a0dd5075f705b5948062ade8b7f5e58bd8ecfb"

    def install
      bin.install "kusion"
    end

    if Hardware::CPU.arm?
      def caveats
        <<~EOS
          The darwin_arm64 architecture is not supported for the Kusion
          formula at this time. The darwin_amd64 binary may work in compatibility
          mode, but it might not be fully supported.
        EOS
      end
    end
  end

  test do
    system "#{bin}/kusion version"
  end
end
