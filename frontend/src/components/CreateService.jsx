import { Form, redirect, useActionData } from "react-router-dom"
import axios from 'axios'

export default function CreateService() {
    const data = useActionData()

    return (
        <>
            <div>Create Service</div>

            {/* maybe use react-select? https://react-select.com/home */}
            <Form method="post" action="/services/create">
                <label>
                    <span>Type</span>
                    <select name="service_type">
                        <option>Select Service</option>
                        <option value="physiotherapy">Physiotherapy</option>
                        <option value="acupunture">Acupuncture</option>
                        <option value="massage_therapy">Massage Therapy</option>
                    </select>
                </label>
                <label>
                    <span>Duration</span>
                    <input type="text" name="duration" />
                </label>
                <label>
                    <span>Price</span>
                    <input type="text" name="price" />
                </label>
                <button>Submit</button>

                {data && data.error && <p>{data.error}</p>}
            </Form>
        </>
    )
}

export const createServiceAction = async ({request}) => {
    const data = await request.formData()
    const submission = {
        service_type: data.get('service_type'),
        duration: data.get('duration'),
        price: data.get('price')
    }

    const url = "http://localhost:3000/services"

    axios.post(url, {
        service_type: submission.service_type,
        duration: submission.duration,
        price: submission.price
    }).then(response => {
        console.log(response)
    })

    return redirect('/services')
}