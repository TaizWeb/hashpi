# hashpi
> Your favorite insecure hashing algorithm

## What is this
A hashing algorithm (I use that term loosely) using the first 26 digits of pi. Made for fun for pi day!

## How does it work
Similar to rot-13, it takes a letter and "rotates it" to the corresponding digit of pi. It then returns a 16 character hash based on the input.

## How secure is it
Not very _at all_. Please don't use this for your startup. While it does support multiple rounds of hashing, I **very strongly, nigh forbid it** to be used for anything where people's data is at stake. There's no salt support, so if you were to do it at the default (one iteration) someone could very easily build a rainbow table and **know exactly what the original password was**.

## Usage
Usage is done with: lua hashpi.lua \<password\> \<iterations\>
![Example usage](https://raw.githubusercontent.com/TaizWeb/hashpi/master/screenshots/screenshot.png)

## Contributing
Please don't. The last thing I want to see is someone making patches to make it more secure and have people start to try to use it. Just enjoy the fact that there's a cool project appreciating pi.

