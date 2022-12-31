# Auto-Confirm Equip

Addon for World of Warcraft Retail.

## Summary

This is a super-lightweight addon (10 lines of code) that does only one thing: Eliminating the confirmation dialog when equipping low/medium-quality BoEs. The quality threshold can be configured if necessary.

## What the addon does, and why

There are already addons that eliminate confirmation dialogs, but I had two problems with those:

1. They eliminate all equip confirmations, regardless of gear quality.
2. Often these addons are bloated with nonsense options, in particular options to eliminate also a plethora of other confirmation dialogs that I would never eliminate because they are absolutely useful (for example the one before setting the hearthstone to a new inn, which is something that can easily be misclicked in the gossip options).

A confirmation when equipping BoEs is – theoretically – also useful. The problem is that after a transmog run we often want to equip a dozen or more pieces for the new appearances, and then the confirmation becomes not only annoying but also dangerously meaningless because it is spammy, which in turn forces us to mechanically click it away, losing all attention to the item we are going to equip.

To make these confirmations meaningful again, the addon eliminates the confirmation up to a certain quality level of the equipment. By default, the max allowed quality is set to 2 (Uncommon/green gear). Anything beyond that (Rare, Epic, Legendary, …) will bring up the usual confirmation dialog.

The point of this is to minimize the risk that you accidentally equip the precious rare drop (which you wanted to sell for 300k in the auction house), while still allowing to quickly equip all the lower quality pieces.

## Changing the quality threshold

If you feel that the max allowed quality of 2 is too low, then you can change the value in the first line of the script (main.lua). To do this, use a simple plain-text editor (e.g. TextEdit, Notepad++). Do not use a word processor (e.g. Microsoft Word), because it might mess up the file. After setting the value, save the file and reload the WoW client UI ( `/reload` ), no need to logout/in.

For example, if you set the max allowed quality to 3, then you can confirmation-free equip everything up to and including Rare (blue) gear.

I recommend to not set the value to anything other than 2 or 3.

Feel free to post suggestions or issues in the [GitHub Issues](https://github.com/tflo/PetWalker/issues) of the repo!
__Please do not post issues or suggestions in the comments on Curseforge.__

