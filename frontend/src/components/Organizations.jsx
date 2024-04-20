import { useLoaderData, Link } from "react-router-dom";
import axios from 'axios';

export default function Organizations() {
    const organizations = useLoaderData()

    return (
        <>
            <div>
                {organizations.map(organization => (
                    <Link to={`/organizations/${organization[1]['id']}`} key={organization[1]['id']}>
                        <p>{organization[1].name}</p>
                    </Link>
                ))}
            </div>
        </>
    )
}

export const organizationsLoader = async () => {
    const url = "http://localhost:3000/organizations"
    const res = axios.get(url).then(response => {
        return Object.entries(response.data)
    })

    return res
}
