import axios from 'axios';
import { Cross2Icon, PlusCircledIcon } from '@radix-ui/react-icons';
import { useState, useEffect } from "react";
import { Table, Flex, Text, Grid, Card, Box, Dialog, Button, TextField } from '@radix-ui/themes';
import EditServiceForm from './EditServiceForm';
import CreateSessionForm from './CreateSessionForm';

export default function Services( { id }) {
    const [services, setServices] = useState([]);
    const [serviceType, setServiceType] = useState();
    const [open, setOpen] = useState(false);

    const getServices = () => {
        const url = `http://localhost:3000/organizations/${id}/services`
        axios.get(url).then(response => {
            setServices(Object.entries(response.data));
        })
    }

    useEffect(() => {
        getServices();
    }, []);

    const handleSubmit = async (e) => {
        // Prevent the default submit and page reload
        e.preventDefault();
        const url = `http://localhost:3000/organizations/${id}/services`
        await axios.post(url, {service_type: serviceType}).then(response => {
            getServices();
        })
        // resets form input
        setServiceType('');
        setOpen(false);
    }

    return (
        <>
            <Box pr="7" pl="7" pt="9">
                <Card size="5">
                    <Grid columns="2" width="500px" gapX="9">
                        <Box>
                            <Table.Root variant='surface' size='2'>
                                <Table.Header>
                                    <Table.Row>
                                    <Table.ColumnHeaderCell>
                                        Services
                                        <Dialog.Root open={open} onOpenChange={setOpen}>
                                            <Dialog.Trigger asChild>
                                            <button className='absolute right-3'>
                                                <PlusCircledIcon />
                                            </button>
                                            </Dialog.Trigger>
                                                <Dialog.Content >
                                                    <Dialog.Title>
                                                        Add service
                                                    </Dialog.Title>
                                                        <form onSubmit={handleSubmit}>
                                                            <label htmlFor="serviceType">
                                                                <Text>Service Type</Text>
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
                                                                    <Button>Cancel</Button>
                                                                </Dialog.Close>
                                                                <Button>Add</Button>
                                                            </Flex>
                                                        </form>
                                                </Dialog.Content>
                                        </Dialog.Root>
                                    </Table.ColumnHeaderCell>
                                    </Table.Row>
                                </Table.Header>
                                <Table.Body>
                                    {services.map(service => (
                                        <Table.Row>
                                            <Table.Cell>
                                                {service[1].service_type}
                                                <EditServiceForm 
                                                    service_id={service[1].id} 
                                                    organization_id={service[1].organization_id}
                                                    getServices={getServices}
                                                />
                                            </Table.Cell>
                                        </Table.Row>
                                    ))}
                                </Table.Body>
                            </Table.Root>
                        </Box>
                        <Box>
                            <Flex direction="column" gap="3">
                                {services.map(service => (
                                    <Card>
                                        <Text size="5">{service[1].service_type}</Text>
                                        <CreateSessionForm 
                                            organization_id={service[1].organization_id} 
                                            service_id={service[1].id} 
                                        />
                                    </Card>
                                ))}
                            </Flex>
                        </Box>
                    </Grid>
                </Card>
            </Box>
        </>    
    )
}
