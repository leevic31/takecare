import { useLoaderData } from "react-router-dom"
import axios from 'axios';
import Services from "./Services";

export default function Organization() {
    const organization = useLoaderData()
    
    return (
        <>  
            <Services id={organization[0][1]} />
        </>
    )
}

export const organizationLoader = async ({ params }) => {
    const { id } = params
    const url = `http://localhost:3000/organizations/${id}`
    
    const authToken = localStorage.getItem('authToken');

    const res = axios.get(url, {
        headers: {
            Authorization: `Bearer ${authToken}`
        }
    }).then(response => {
        return Object.entries(response.data)
    })
    
    return res
}
