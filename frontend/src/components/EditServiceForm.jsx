import { Pencil1Icon } from '@radix-ui/react-icons';
import React, { useState } from 'react'
import axios from 'axios';
import { Dialog, Button, Flex, Text, TextField } from "@radix-ui/themes";

export default function EditServiceForm( { organization_id, service_id, getServices } ) {
    const [open, setOpen] = useState(false);
    const [serviceType, setServiceType] = useState();

    const handleSubmit = async (e) => {
        e.preventDefault();
        const url = `http://localhost:3000/organizations/${organization_id}/services/${service_id}`
        await axios.patch(url, {service_type: serviceType}).then(response => {
            getServices();
        })
        setServiceType('');
        setOpen(false);
    }
    
    return (
        <>
            <Dialog.Root open={open} onOpenChange={setOpen}>
                <Dialog.Trigger asChild>
                <button className="absolute right-3">
                    <Pencil1Icon/>
                </button>
                </Dialog.Trigger>
                <Dialog.Content>
                    <Dialog.Title>
                        Update service
                    </Dialog.Title>
                    <form onSubmit={handleSubmit}>
                        <label htmlFor="serviceType">
                            <Text>
                                Service Type
                            </Text>
                            <TextField.Root 
                                type="text"
                                name="serviceType"
                                value={serviceType}
                                onChange={(e) => setServiceType(e.target.value)}
                                id="serviceType"
                            />
                        </label>
                        <Flex gap="3" mt="4" justify="end">
                            <Dialog.Close asChild>
                                <Button>
                                    Cancel
                                </Button>
                            </Dialog.Close>
                            <Button >Update</Button>
                        </Flex>
                    </form>
                </Dialog.Content>
            </Dialog.Root>
        </>
    )
}
