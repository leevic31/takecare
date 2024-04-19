import { Form, redirect, useActionData } from "react-router-dom"
import axios from 'axios';

export default function CreateOrganization() {
    const data = useActionData()

    return (
        <>
            <div>Create Organization</div>

            <Form method="post" action="/organizations/create">
                <label>
                    <span>
                        Organization
                    </span>
                    <input type="text" name="name" />
                </label>
                <button>Submit</button>
                {data && data.error && <p>{data.error}</p>}
            </Form>
        </>
    ) 
}

// request contains all of the form data (input values)
export const createOrganizationAction = async ({request}) => {
    const data = await request.formData()
    const submission = {
        name: data.get('name')
    }

    if (submission.name.length > 50) {
        return {error: "Name can not be longer than 50 chars long"}
    }

    const url = "http://localhost:3000/organizations"

    axios.post(url, {
        name: submission.name
    }).then(response => {
        console.log(response)
    })

    return redirect('/organizations')
}
