import { useState } from "react"
import axios from 'axios';
import { Dialog, Button, Flex, Text } from "@radix-ui/themes";
import { TrashIcon } from '@radix-ui/react-icons';

export default function DeleteService({ organization_id, service_id, getServices }) {
    const [open, setOpen] = useState(false);

    const handleSubmit = async (e) => {
        e.preventDefault();
        const url = `http://localhost:3000/organizations/${organization_id}/services/${service_id}`
        await axios.delete(url).then(response => {
            console.log(response)
            getServices();
        })
        setOpen(false);
    }
    return (
        <>
            <Dialog.Root open={open} onOpenChange={setOpen}>
                <Dialog.Trigger asChild>
                    <button className=''><TrashIcon/></button>
                </Dialog.Trigger>
                <Dialog.Content >
                <Dialog.Title>Add service</Dialog.Title>
                    <form onSubmit={handleSubmit}>
                        <label>
                            <Text>Are you sure you want to delete this service?</Text>
                        </label>
                        <Flex gap="3" mt="4" justify="end">
                            <Dialog.Close asChild>
                                <Button>Cancel</Button>
                            </Dialog.Close>
                            <Button>Delete</Button>
                        </Flex>
                    </form>
                </Dialog.Content>
            </Dialog.Root>
        </>
    )
}
