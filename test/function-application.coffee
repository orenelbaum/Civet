{testCase} = require "./helper"

describe "function application", ->
  testCase """
    basic
    ---
    f x
    ---
    f(x);
  """

  testCase """
    chained
    ---
    f(x)(7)
    ---
    f(x)(7);
  """

  testCase """
    spaced associative
    ---
    a b c
    ---
    a(b(c));
  """

  testCase """
    arguments on separate lines
    ---
    const config2 = ts.parseJsonConfigFileContent(
      config,
      ts.sys,
      currentProjectPath,
      existingOptions,
      tsConfigPath,
      undefined,
    )
    ---
    const config2 = ts.parseJsonConfigFileContent(
      config,
      ts.sys,
      currentProjectPath,
      existingOptions,
      tsConfigPath,
      undefined,
    );
  """

  testCase """
    arguments on separate lines, optional commas
    ---
    const config2 = ts.parseJsonConfigFileContent(
      config
      ts.sys
      currentProjectPath,
      existingOptions
      tsConfigPath,
      undefined
    )
    ---
    const config2 = ts.parseJsonConfigFileContent(
      config,
      ts.sys,
      currentProjectPath,
      existingOptions,
      tsConfigPath,
      undefined,
    );
  """

  testCase """
    arguments on separate lines, multiple argumenns per line
    ---
    const config2 = ts.parseJsonConfigFileContent(
      config, ts.sys
      currentProjectPath,
      existingOptions
      tsConfigPath, undefined
    )
    ---
    const config2 = ts.parseJsonConfigFileContent(
      config, ts.sys,
      currentProjectPath,
      existingOptions,
      tsConfigPath, undefined,
    );
  """

  testCase """
    tailing call after spaced application end of line
    ---
    readFile x
    .then -> y
    .catch -> z
    ---
    readFile(x)
    .then(function() { y })
    .catch(function() { z });
  """

  testCase """
    nested tailing call
    ---
    readFile x
      .getThing().wat
      .asFile()
    .then -> y
    .catch -> z
    ---
    readFile(x
      .getThing().wat
      .asFile())
    .then(function() { y })
    .catch(function() { z });
  """

  describe.skip "TODO", ->
    testCase """
      tailing call after end of line parens
      ---
      readFile(x)
      .then -> y
      .catch -> z
      ---
      readFile(x)
      .then(function() { y })
      .catch(function() { z });
    """
