import { Outlet, useLoaderData } from "react-router-dom"
import axios from 'axios';
import Services from "./Services";
import { Theme } from '@radix-ui/themes';


export default function Organization() {
    const organization = useLoaderData()

    return (
        <>  
            {/* <div className= "grid grid-cols-2 gap-4">
                <div>
                    <h1>{organization[1][1]}</h1>
                </div>
            </div>

            <Theme>
                <CreateService id={organization[0][1]} />
            </Theme> */}

            <Theme>
                <Services id={organization[0][1]} />
            </Theme>
                
            <Outlet />
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