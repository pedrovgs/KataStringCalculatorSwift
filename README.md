String Calculator
=================

String Calculator Kata implemented in Swift:

**1. Create a simple String calculator with a method ``add(numbers: String) -> Int``.**

* The method can take 0, 1 or 2 numbers inside the input string, and will return their sum (for an empty string it will return 0. An example could be “” or “1” or “1,2”.

* Start with the simplest test case of an empty string and move to 1 and two numbers.

* Remember to solve things as simply as possible so that you force yourself to write tests you did not think about.

* Remember to refactor after each passing test.

**2. Allow the ``add`` method to handle an unknown amount of numbers inside the string passed as parameter.**

**3. Allow the ``add`` method to handle new lines between numbers (instead of commas).**

* The following input is ok:  “1\n2,3”  (will equal 6)

* The following input is NOT ok:  “1,\n” (not need to prove it - just clarifying)

**4. If a delimiter different of "," or "\n" is used, throw an exception.

***END OF THE FIRST PART OF THIS KATA***

**5. Support different delimiters.**

* To change a delimiter, the beginning of the string will contain a separate line that looks like this:   “//[delimiter]\n[numbers…]” for example “//;\n1;2” should return three where the default delimiter is ‘;’ .
* the first line is optional. all existing scenarios should still be supported

**6. Calling ``add`` with a negative number will throw an exception negatives not allowed, and the negative that numers passed. If there are multiple negatives, show all of them in the exception message**


**7. Numbers bigger than 1000 should be ignored, so adding 2 + 1001  = 2**

**8. Delimiters can be of any length with the following format:  “//[delimiter]\n” for example: “//[~.-]\n1,.2[~.-]3” should return 6**

**9. Allow multiple delimiters like this:  “//[delim1][delim2]\n” for example “//[*][%]\n1*2%3” should return 6.**

**10. Make sure you can also handle multiple delimiters with length longer than one char.**


Developed By
------------

* Pedro Vicente Gómez Sánchez - <pedrovicente.gomez@gmail.com>

<a href="https://twitter.com/pedro_g_s">
  <img alt="Follow me on Twitter" src="https://image.freepik.com/iconos-gratis/twitter-logo_318-40209.jpg" height="60" width="60"/>
</a>
<a href="https://es.linkedin.com/in/pedrovgs">
  <img alt="Add me to Linkedin" src="https://image.freepik.com/iconos-gratis/boton-del-logotipo-linkedin_318-84979.png" height="60" width="60"/>
</a>



License
-------

Copyright 2015 Pedro Vicente Gómez Sánchez

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
