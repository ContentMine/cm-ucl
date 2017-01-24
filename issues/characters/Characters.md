# Characters

Characters are the primary way that PDF communicates character data. There are no words, paragraphs... A character has:
* x-y coordinates (PDF2SVG resolves transforms and generates page coordinates (e.g. 0,700 0,800);
* a codepoint (normally a number pointing to an index in a known Code, such as Unicode)
* a font-family
* fill and stroke colours
* font-weight ("normal", "bold" ...)
* font-style ("normal", "italic" ...)
* a transformation matrix to scale, rotate, transform; more generally any affine such as shear, perspective.

