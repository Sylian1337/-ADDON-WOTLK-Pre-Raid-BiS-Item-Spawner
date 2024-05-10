local addon, namespace = ...

-- Create a new table called "Commands", which holds all the functions to call.
namespace.Commands = {}

function namespace.Commands.DeathKnightGear(spec)
	for index, item in pairs(namespace.ItemListsScript.ItemLists.DeathKnight.Spec[spec]) do
		SendChatMessage(".additem " .. item, "SAY")
	end
end

function namespace.Commands.Druid(spec)
	for index, item in pairs(namespace.ItemListsScript.ItemLists.Druid.Spec[spec]) do
		
		SendChatMessage(".additem " .. item, "SAY")
	end
end

function namespace.Commands.Hunter(spec)
	for index, item in pairs(namespace.ItemListsScript.ItemLists.Hunter.Spec[spec]) do
		SendChatMessage(".additem " .. item, "SAY")
	end
end

function namespace.Commands.Mage(spec)
	for index, item in pairs(namespace.ItemListsScript.ItemLists.Mage.Spec[spec]) do
		SendChatMessage(".additem " .. item, "SAY")
	end
end

function namespace.Commands.Paladin(spec)
	for index, item in pairs(namespace.ItemListsScript.ItemLists.Paladin.Spec[spec]) do
		SendChatMessage(".additem " .. item, "SAY")
	end
end

function namespace.Commands.Priest(spec)
	for index, item in pairs(namespace.ItemListsScript.ItemLists.Priest.Spec[spec]) do
		SendChatMessage(".additem " .. item, "SAY")
	end
end

function namespace.Commands.Rogue(spec)
	for index, item in pairs(namespace.ItemListsScript.ItemLists.Rogue.Spec[spec]) do
		SendChatMessage(".additem " .. item, "SAY")
	end
end

function namespace.Commands.Shaman(spec)
	for index, item in pairs(namespace.ItemListsScript.ItemLists.Shaman.Spec[spec]) do
		SendChatMessage(".additem " .. item, "SAY")
	end
end

function namespace.Commands.Warlock(spec)
	for index, item in pairs(namespace.ItemListsScript.ItemLists.Warlock.Spec[spec]) do
		SendChatMessage(".additem " .. item, "SAY")
	end
end

function namespace.Commands.Warrior(spec)
	for index, item in pairs(namespace.ItemListsScript.ItemLists.Warrior.Spec[spec]) do
		SendChatMessage(".additem " .. item, "SAY")
	end
end