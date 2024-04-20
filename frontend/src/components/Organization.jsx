import { useLoaderData } from "react-router-dom"
import axios from 'axios';

export default function Organization() {
    const organization = useLoaderData()

    return (
        <>
            <h1>{organization[1][1]}</h1>
        </>
    )
}

export const organizationLoader = async ({ params }) => {
    const { id } = params
    const url = `http://localhost:3000/organizations/${id}`
    const res = axios.get(url).then(response => {
        return Object.entries(response.data)
    })

    return res
}