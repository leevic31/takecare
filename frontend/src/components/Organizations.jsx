import React from 'react'

export default function Organizations({organizations}) {
    return (
        <>
            <div>
                {organizations.map(org => (
                    <p>{org[1].name}</p>
                ))}
            </div>
        </>
    )
}
