import React from 'react'

export default function OptionsButton() {
  return (
    <>
        <Menu>
            <MenuButton>
            <EllipsisHorizontalIcon/>
            </MenuButton>
            <MenuItems>
                <MenuItem>
                <button className="group flex w-full items-center gap-2 rounded-lg py-1.5 px-3 data-[focus]:bg-white/10">
                    Edit
                    <kbd className="ml-auto hidden font-sans text-xs text-white/50 group-data-[focus]:inline">⌘E</kbd>
                </button>
                </MenuItem>
            </MenuItems>
        </Menu>
    </>
  )
}
