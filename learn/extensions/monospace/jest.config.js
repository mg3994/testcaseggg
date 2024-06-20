/** @type {import('ts-jest').JestConfigWithTsJest} */
module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  collectCoverage: false,
  // ensure completely uncovered files contribute to the report coverage %
  collectCoverageFrom: ['src/**/*.{ts,jxs}'],
};
