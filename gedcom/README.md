# GEDCOM Parser

## GEDCOM Parser

GEDCOM is the "GEnealogical Data COMmunication" file format. It is a plain-text electronic format used to transfer genealogical data. (The purpose of this quiz is not to debate whether it is a particularly *good* file format or not--but it is certainly more compact than the corresponding XML would be, and bandwidth was particularly important back when the standard was developed.)

The purpose of this quiz is to develop a simple parser than can convert a GEDCOM file to XML.

## GEDCOM Format

The GEDCOM file format is very straightforward. Each line represents a node in a tree. It looks something like this:

```
  0 @I1@ INDI
  1 NAME Jamis Gordon /Buck/
  2 SURN Buck
  2 GIVN Jamis Gordon
  1 SEX M
  ...
```

In general, each line is formatted this:

` LEVEL TAG-OR-ID [DATA]

The LEVEL is an integer, representing the current depth in the tree. If subsequent lines have greater levels than the current node, they are children of the current node.

TAG-OR-ID is either a tag that identifies the type of data in that node, or it is a unique identifier. Tags are 3- or 4-letter words in uppercase. The unique identifiers are always text surrounded by "@" characters (i.e., "@I54@"). If an ID is given, the DATA is the type of the subtree that is identified.

So, to take the example given above apart:

1) "0 @I1@ INDI". This starts a new subtree of type INDI (individual). The id for this individual is "@I1@".

2) "1 NAME Jamis Gordon /Buck/". This starts a NAME subtree with a value of "Jamis Gordon /Buck/".

3) "2 SURN Buck". This is a subelement of the NAME subtree, of type SURN ("surname").

4) "2 GIVN Jamis Gordon". As SURN, but specifies the given name of the individual.

5) "1 SEX M". Creates a new subelement of the INDI element, of type "SEX" (i.e., "gender").

And so forth.

Variable whitespace is allowed between the level and the tag. Blank lines are ignored.

## The Challenge

The challenge, then, is to create a parser that takes a GEDCOM file as input and converts it to XML. The snippet of GEDCOM given above would become:

```xml
<gedcom>
  <indi id="@I1@">
    <name value="Jamis Gordon /Buck/">
      <surn>Buck</surn>
      <givn>Jamis Gordon</givn>
    </name>
    <sex>M</sex>
    ...
  </indi>
  ...
</gedcom>
```

## Sample Input

There is a large [GECOM file](http://www.rubyquiz.com/royal.ged) online containing the lineage of various European royalty. This particular ﬁle makes generous use of whitespace to increase readability.
