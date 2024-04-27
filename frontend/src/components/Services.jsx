import { useLoaderData } from "react-router-dom";
import axios from 'axios';

export default function Services() {
    const services = useLoaderData()

    return (
        <>
            <div>
                {services.map(service => (
                    <div>
                        <p>{service[1].service_type}</p>
                    </div>
                ))}
            </div>
        </>    
    )
}

export const servicesLoader = async () => {
    const url = "http://localhost:3000/organizations/1/services"
    const res = axios.get(url).then(response => {
        return Object.entries(response.data)
    })

    return res
}