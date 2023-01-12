# refer-styles

_Collection of citation styles for academic writing in groff_

---

This repository contains custom citation styles for the `groff` document formatting system and the `refer` preprocessor.
In-text citations and end references are generated in accordance with the preferred style.

The following `groff` macro packages are supported: `ms`, `me`.

__Note:__ WIP. Some entries might not work as expected. Contributions are very welcome.

## Supported Styles

+ APA

+ MLA

## Basic Usage

The following lines must appear before the references in your document. If they appear after the references, they will not affect the resulting output.

+ Source the preferred citation style for the utilized macro package in your document.

> `.so /path/to/<style-package>.tmac`

> Example: `.so /path/to/apa-ms.tmac`

+ Put the __contents__ of the `refer` block for the preferred citation style in your document.

> Example: `apa-block.txt`
>
> ```
> \" --- REFER BLOCK FOR THE APA CITATION STYLE ---
> .R1
> database /path/to/refer-bibliographic-database
> sort A+
> accumulate
> move-punctuation
> label "(@|Q) ', ''\*[MIDINFO]' D '\*[ENDINFO]'"
> short-label "'\*[MIDINFO]' D '\*[ENDINFO]'"
> bracket-label " (" ")" "; "
> join-authors " & " ", " " & "
> no-label-in-reference
> .R2
>
> ```

+ Edit the line that begins with the word "database", and provide the path to your own `refer` bibliographic database instead.

+ Append the following lines to your document to list the end references in a separate page.

> ```
> .bp
> .[
> $LIST$
> .]
> ```

+ Continue to write your document and your references as you normally would.

## In-Text Page Numbers and Other Information

In the APA style `refer` block example above, the `MIDINFO` and the `ENDINFO` string variables are used, but they are not defined.
By default, they do not affect the output, and the in-text citation is produced in the following format: "(LastName, Year)".

However, when needed, these strings can be defined in order to provide additional information (such as page numbers) that will appear in the in-text citation.
This can be done with `.ds <string> <definition>`.
Anything that comes after the name of the string variable and a single space is counted as part of the string definition.

For example, a text like the following:

> ```
> .ds ENDINFO , p. 99
> This is a sentence.
> .[
> example-bibliographic-database-entry
> .]
> ```

Will produce an output like this (provided that the database entry exists):

> __This is a sentence (Example, 2021, p. 99).__

Once you define a string in a document, its definition applies from that point forward, unless you change it again.
When you need to add another citation, you can redefine the string before the phrase like this:

> `.ds ENDINFO , p. 100`

You can do it again, but with multiple pages, like this:

> `.ds ENDINFO , pp. 101-102`

You can add information in the middle like this:

> ```
> \" This string definition has a trailing whitespace
> \" to accomodate for the space after the comma!
> .ds MIDINFO personal communication, 
> ```

Or if you need to revert to the default format, you can simply empty the strings like this:

> ```
> .ds MIDINFO
> .ds ENDINFO
> ```

## Other Solutions for In-Text Citations

In-text citations might require different levels of information depending on the source type.

### Providing _More_ Information

More information can always be provided using the methods described above.
More string variables can be defined, added to the `label` command in the `refer` block, and used if necessary.

There are other ways of providing information for in-text citations, such as defining/redefining bibliographic database fields in citations or using the `opening-text` and `closing-text` components described in the `refer` manual page, which can be viewed with `man refer`.
String variables offer more flexibility, and they unify the procedures for appending information to in-text citations.
However, if you wish to use other methods, you can tweak the options in the `refer` block to fit your needs.

### Providing _Less_ Information

In certain cases, you might want to omit some information (usually the author).
For such cases, the `short-label` command is included in the `refer` block.
The label specified by `short-label` is used in a citation, if the citation includes the "#" flag component.

Here is an example:

> ```
> Dr. Example states that this is a sentence.
> .[
> # example-bibliographic-database-entry
> .]
> ```

Which would produce this output:

> __Dr. Example states that this is a sentence (2021).__

Strings can still be used to provide additional information if needed.

### Manually Writing In-Text Citations

If you wish to completely disable in-text citations, you may put this line in your `refer` block:

> `no-label-in-text`

You can then manually write the in-text citations, while still automatically generating the end references.

---

### License

GNU General Public License, version 3
