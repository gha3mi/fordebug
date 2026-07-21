## [v0.2.1](https://github.com/gha3mi/fordebug/compare/v0.2.0...v0.2.1) - 2026-07-21


### Fixes

* fix: rename .f90 to .F90 ([68f5202](https://github.com/gha3mi/fordebug/commit/68f520286f8f8c50e6145a3f695fea485dfac444)) by [@gha3mi](https://github.com/gha3mi)
* fix: NOPURE_DEBUG compilation issue ([c5b25fc](https://github.com/gha3mi/fordebug/commit/c5b25fc58d9bae63f5843abbcb3096de5263789d)) by [@gha3mi](https://github.com/gha3mi)
* fix: update use statement for iso_fortran_env to intrinsic ([8950b40](https://github.com/gha3mi/fordebug/commit/8950b4047a645fb93ee322d9ff173293847ac5da)) by [@gha3mi](https://github.com/gha3mi)
* fix: update CI/CD workflow ([fee972d](https://github.com/gha3mi/fordebug/commit/fee972d5d0592d294948a9dfe230323c83d8c75d)) by [@gha3mi](https://github.com/gha3mi)
* fix: remove alias rk ([c82814f](https://github.com/gha3mi/fordebug/commit/c82814fb9d76b3b986e977b2206a93e175a20fdc)) by [@gha3mi](https://github.com/gha3mi)
* fix: update copyright year to 2026 ([4bb79da](https://github.com/gha3mi/fordebug/commit/4bb79da78f433dbab49f5cb3ef4ae00a7432a5d6)) by [@gha3mi](https://github.com/gha3mi)
* fix: fortitude errors ([ccafe75](https://github.com/gha3mi/fordebug/commit/ccafe75df37c8eade2b1979596115c87a4381b02)) by [@gha3mi](https://github.com/gha3mi)
* fix: update file paths in pwrite calls and adjust concurrent loop variable handling ([c7b7bf4](https://github.com/gha3mi/fordebug/commit/c7b7bf41a787e69634d1d46f42e92192c3e61ad5)) by [@gha3mi](https://github.com/gha3mi)
* fix: comment out file writing in pwrite calls in example_p.F90 and test1.f90 ([700e7eb](https://github.com/gha3mi/fordebug/commit/700e7ebe47d5d88215e77fbe270d471b538fd213)) by [@gha3mi](https://github.com/gha3mi)
* fix: enable exporting procedures for MS-compatible linkers ([542ed2a](https://github.com/gha3mi/fordebug/commit/542ed2a0523d3446607c92f6571ad7bafe154507)) by [@gha3mi](https://github.com/gha3mi)
* fix: update copyright year ([8d73ed3](https://github.com/gha3mi/fordebug/commit/8d73ed3aff10b45ba16f9c79212ffcb9e48b2c9d)) by [@gha3mi](https://github.com/gha3mi)

### Others

* add new feature and fix bugs ([#5](https://github.com/gha3mi/fordebug/pull/5)) by [@gha3mi](https://github.com/gha3mi)
* update README.md status table ([#4](https://github.com/gha3mi/fordebug/pull/4)) by [@gha3mi](https://github.com/gha3mi)
* chore: update fpm.toml metadata ([ce45235](https://github.com/gha3mi/fordebug/commit/ce452350e26d9e94f6748021baaf60a0981dfd86)) by [@gha3mi](https://github.com/gha3mi)
* Update README.md status table [ci skip] (#7) ([28a4595](https://github.com/gha3mi/fordebug/commit/28a4595ca494511710e8e28fb6f6dc22def09efd)) by [@gha3mi](https://github.com/gha3mi)
* doc: fix typo ([d28e482](https://github.com/gha3mi/fordebug/commit/d28e482e59fd04357b5f1bdef5e3c6025173a489)) by [@gha3mi](https://github.com/gha3mi)
* CI: update fpm test commands to use FPM_FC environment variable ([79804e0](https://github.com/gha3mi/fordebug/commit/79804e030ddf05384947783387152a3b3a58d974)) by [@gha3mi](https://github.com/gha3mi)
* Update README.md status table [ci skip] (#8) ([3d5653f](https://github.com/gha3mi/fordebug/commit/3d5653f80f0c043e4116b6085c69637ffb08ff46)) by [@gha3mi](https://github.com/gha3mi)


### Contributors
- [@gha3mi](https://github.com/gha3mi)



Full Changelog: [v0.2.0...v0.2.1](https://github.com/gha3mi/fordebug/compare/v0.2.0...v0.2.1)

## [v0.2.0](https://github.com/gha3mi/fordebug/compare/v0.1.0...v0.2.0) - 2025-08-13


### Features

* [#2] feat: add new derived type for error/warning/info control ([530f24a](https://github.com/gha3mi/fordebug/commit/530f24ab73e26c4ca888a0fbdca1ee3158bbd65f)) by [@gha3mi](https://github.com/gha3mi)
* [#2] feat: add cmake support ([09c280a](https://github.com/gha3mi/fordebug/commit/09c280afbfaad972cfde8338f9964e8fb11b6a8d)) by [@gha3mi](https://github.com/gha3mi)

### Fixes

* [#2] fix: intent(in) to intent(inout) for timer subroutines ([4ca47cb](https://github.com/gha3mi/fordebug/commit/4ca47cbfd21190fcba7fb222e4eb5b589c9835ff)) by [@gha3mi](https://github.com/gha3mi)
* [#2] fix: update example ([ced0ee8](https://github.com/gha3mi/fordebug/commit/ced0ee8ba42e8849b6f14e1e2b7aa6f1e3564eb9)) by [@gha3mi](https://github.com/gha3mi)
* [#2] fix: add FOR_DEBUG flag to example runs ([22158da](https://github.com/gha3mi/fordebug/commit/22158daeee56ac3be6aaf6843b392fb67636aa9f)) by [@gha3mi](https://github.com/gha3mi)

### Others

* update README.md status table ([#3](https://github.com/gha3mi/fordebug/pull/3)) by [@gha3mi](https://github.com/gha3mi)
* [#3] Update README.md status table [ci skip] ([0ebbbc8](https://github.com/gha3mi/fordebug/commit/0ebbbc8c047ab4b5b5a0ea21ccd771e47f2307e8)) by [@gha3mi](https://github.com/gha3mi)
* Feature Additions and Bug Fixes ([#2](https://github.com/gha3mi/fordebug/pull/2)) by [@gha3mi](https://github.com/gha3mi)
* [#2] chore: update fpm.toml ([8727b2f](https://github.com/gha3mi/fordebug/commit/8727b2f4204479188d59e811013621dca578aa0d)) by [@gha3mi](https://github.com/gha3mi)
* [#2] docs: update README ([653b590](https://github.com/gha3mi/fordebug/commit/653b590ee7871e5db201b7b6cb27dc59d8ec2822)) by [@gha3mi](https://github.com/gha3mi)
* [#2] chore: update CI/CD ([51d3092](https://github.com/gha3mi/fordebug/commit/51d30924e526d9c7808ca5cd93f9c2b2483ef6e0)) by [@gha3mi](https://github.com/gha3mi)
* [#2] chore: add release.sh script ([8528605](https://github.com/gha3mi/fordebug/commit/8528605dbdcb3132b089374b31842f123905e4a7)) by [@gha3mi](https://github.com/gha3mi)
* [#2] refactor: add implicit none to subroutines and update use statements ([8d29a84](https://github.com/gha3mi/fordebug/commit/8d29a84f08456f16c08eb13ac45bb8cde8f740a8)) by [@gha3mi](https://github.com/gha3mi)
* Update documentation. ([6de24f0](https://github.com/gha3mi/fordebug/commit/6de24f0caec6adbe05e2a7374c11bef5872a1246)) by [@gha3mi](https://github.com/gha3mi)
* Update README. ([6df58d0](https://github.com/gha3mi/fordebug/commit/6df58d0e8accfcfb6b31b586dca069e911ff8580)) by [@gha3mi](https://github.com/gha3mi)
* Update README. ([a560f3c](https://github.com/gha3mi/fordebug/commit/a560f3c0820ea4062f739fcf9c205057640d7404)) by [@gha3mi](https://github.com/gha3mi)
* Fix ford.yml link address. ([7dd306d](https://github.com/gha3mi/fordebug/commit/7dd306d2bd55880f8c25c1e4208020397827adad)) by [@gha3mi](https://github.com/gha3mi)
* Use only the timer type from the ForTime module. ([328c248](https://github.com/gha3mi/fordebug/commit/328c2480ba8e3f7b4e531192afe5e9b7d1f53aaf)) by [@gha3mi](https://github.com/gha3mi)
* CI-CD: use setup-fortran-conda ([8659255](https://github.com/gha3mi/fordebug/commit/86592557b7e37ff4068c48a10cea1d7dbb40988c)) by [@gha3mi](https://github.com/gha3mi)
* Update README.md status table [ci skip] (#1) ([d625a0f](https://github.com/gha3mi/fordebug/commit/d625a0f01158332cb821553e944083d6d2970bdb)) by [@gha3mi](https://github.com/gha3mi)
* chore: fix ford documentation [skip ci] ([8552086](https://github.com/gha3mi/fordebug/commit/8552086240057603976fb149d366ea60a4eed3a9)) by [@gha3mi](https://github.com/gha3mi)


### Contributors
- [@gha3mi](https://github.com/gha3mi)



Full Changelog: [v0.1.0...v0.2.0](https://github.com/gha3mi/fordebug/compare/v0.1.0...v0.2.0)
