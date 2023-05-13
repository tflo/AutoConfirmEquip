# Auto-Confirm Equip

Addon for WoW Retail.

## Summary

This is a super-lightweight addon that does only one thing: Eliminating the confirmation dialog when equipping BoEs of a configurable quality (defaults: Poor, Common, Uncommon). 

## What the addon does, and why

There are already addons that eliminate confirmation dialogs, but I had two problems with those:

- They eliminate all equip confirmations, regardless of gear quality.
- Often these addons are bloated with nonsense options, in particular options to eliminate also a plethora of other confirmation dialogs that I would never eliminate because they are absolutely useful (for example the one before setting the hearthstone to a new inn, which is something that can easily be misclicked in the gossip options).

The confirmation when equipping BoEs is —in theory— also useful. The problem is that after a transmog run we often want to equip a dozen or more pieces for the new appearances, and then the confirmation becomes not only annoying but also dangerously meaningless because it is spammy, which in turn forces us to mechanically click it away, losing all attention to the item we are going to equip.

To make these confirmations meaningful again, the addon eliminates the confirmation just for some quality levels of the equipment. By default, the allowed qualities are set to 0 through 2 (i.e. up to and including Uncommon/Green gear). Anything beyond that (Rare, Epic, Legendary, …) will bring up the usual confirmation dialog.

The point of this is to minimize the risk that you accidentally equip the precious rare drop (which you wanted to sell for 300k in the auction house), while still allowing to quickly equip e.g. all the lower quality pieces.

## Configuring the confirmation-less qualities

The slash command of the addon is `/aceq` or `/autoconfirmequip`. Enter that command, followed by the numeric quality levels where you don’t want to be bothered with a confirmation dialog.

The default setting (up to and including Green quality) corresponds to `/aceq 012`. If you type `/aceq 02`, then the dialog would be eliminated only for quality 0 (Poor/Gray) and quality 2 (Uncommon/Green), but not for quality 1 (Common/White). It is pretty straightforward, you don't even have to type the numbers in order.

If you just type `/aceq`, you will get a help text on how to set the qualities, an index of all qualities, and information on the currently set quality levels.

---

Feel free to post suggestions or issues in the [GitHub Issues](https://github.com/tflo/AutoConfirmEquip/issues) of the repo!
__Please do not post issues or suggestions in the comments on Curseforge.__

