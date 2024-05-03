import { useEffect, useState } from "react"
import axios from 'axios';
import { Dialog, Button, Flex, Text, TextField, TextArea, Select } from "@radix-ui/themes";
import { PlusCircledIcon } from '@radix-ui/react-icons';

export default function CreateSessionForm( { organization_id, service_id }) {
    const [sessions, setSessions] = useState([]);
    const [open, setOpen] = useState(false);
    const [title, setTitle] = useState();
    const [description, setDescription] = useState();
    const [duration, setDuration] = useState();
    const [price, setPrice] = useState();

    const getSessions = () => {
        const url = `http://localhost:3000/organizations/${organization_id}/services/${service_id}/sessions`
        axios.get(url).then(response => {
            setSessions(Object.entries(response.data));
        })
    }

    useEffect(() => {
        getSessions();
    }, []);

    const handleSubmit = async (e) => {
        e.preventDefault();
        const url = `http://localhost:3000/organizations/${organization_id}/services/${service_id}/sessions`
        axios.post(url, {title: title, description: description, duration: duration, price: price}).then(response => {
            getSessions();
        })
        setTitle('');
        setOpen(false);
    }

    return (
        <>
            <Dialog.Root open={open} onOpenChange={setOpen}>
                <Dialog.Trigger asChild>
                <button className='absolute right-3'>
                    <PlusCircledIcon />
                </button>
                </Dialog.Trigger>
                    <Dialog.Content>
                        <Dialog.Title>Add session</Dialog.Title>
                            <form onSubmit={handleSubmit}>
                                <label htmlFor="title">
                                    <Text>Title</Text>
                                    <TextField.Root
                                        type="text"
                                        name="title"
                                        value={title}
                                        onChange={(e) => setTitle(e.target.value)}
                                        id="title"
                                    />
                                </label>
                                <label htmlFor="description">
                                    <Text>Description</Text>
                                    <TextArea 
                                        type="text"
                                        name="description"
                                        value={description}
                                        onChange={(e) => setDescription(e.target.value)}
                                        id="description"
                                        size="3"
                                    />
                                </label>
                                <label htmlFor="price">
                                    <Text>Price</Text>
                                    <TextField.Root
                                        type="text"
                                        name="price"
                                        value={price}
                                        onChange={(e) => setPrice(e.target.value)}
                                        id="price"
                                    />
                                </label>
                                <label htmlFor="price">
                                    <Text>Duration</Text>
                                    <Select.Root defaultValue="30">
                                        <Select.Trigger />
                                        <Select.Content>
                                            <Select.Group>
                                                <Select.Item value="30">30 minutes</Select.Item>
                                                <Select.Item value="60">60 minutes</Select.Item>
                                                <Select.Item value="90">90 minutes</Select.Item>
                                            </Select.Group>
                                        </Select.Content>
                                    </Select.Root>
                                </label>
                                <Flex gap="3" mt="4" justify="end">
                                    <Dialog.Close asChild>
                                        <Button>Cancel</Button>
                                    </Dialog.Close>
                                    <Button>Add</Button>
                                </Flex>
                            </form>
                    </Dialog.Content>
            </Dialog.Root>
        </>
    )
}
