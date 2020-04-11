import React, { useRef, useState } from 'react';
import { Button, Text, View, TextInput, ScrollView, Image } from 'react-native';
import { Form } from '@unform/mobile';
import Input from './components/Form/Input';
import { TextInputMask } from 'react-native-masked-text'; 

import styles from './studentStyle'
import globalstyle from './globalstyle'
import img from '../../assets/splash.png'
import api from '../services/api';

export default function Student() {
//export default class App extends Component {    

/*  
  async function routes_newstudent(data) {
    console.log('x')
    console.log(data)

    
//    try {
      await api.post('routes_newstudent', data)
     
    //} catch (err) {
//      alert('Erro ao cadastrar aluno, tente novamente.')
    //}
  }
*/
    const formRef = useRef(null)


    const [name_pers, Setname_pers] = useState('');
    const [address_pers, Setaddress_pers] = useState('');
    const [city_pers,  Setcity_pers] = useState('');
    const [zipcode_pers, Setzipcode_pers] = useState('');
    const [birth_pers, Setbirth_pers] = useState('');
    const [cpf_pers, Setcpf_pers] = useState('');
    const [rg_pers, Setrg_pers] = useState('');
    const [phonewhats_pers, Setphonewhats_pers] = useState('');
    const [comments_pers, Setcomments_pers] = useState('');
    
    async function handleRegister(e) {
      e.preventDefault();
  
      const data = {
        name_pers,
        address_pers,
        city_pers,
        zipcode_pers,
        birth_pers,
        cpf_pers,
        rg_pers,
        phonewhats_pers,
        comments_pers};
  
      try {
        const response = await api.post('routes_newstudent', data);
  
        alert(`Seu ID de acesso: ${response.data.id}`);
      } catch (err) {
        alert('Erro no cadastro, tente novamente.');
      }
    }


  return (
    <ScrollView style={globalstyle.container}>
         <Image source= {img} />
        <View style={styles.forms}>
            <Form ref={formRef} onSubmit={handleRegister}>
                <Text style={styles.inputLabel}>Nome do Aluno</Text>
                <TextInput 
                    style={styles.inputText} 
                    name="name_pers" 
                    type="date"
                    MaskedInput
                    placeholder="Nome"
                    onChange={e => Setname_pers(e.target.value)}
                />

                <Text style={styles.inputLabel}>Endereço</Text>       
                <Input 
                    style={styles.inputText} 
                    name="address_pers" 
                    type="email" 
                    onChange={e => Setaddress_pers(e.target.value)}
                />

                <View style={styles.CidyContainer}>
                    <View style={{width:'68%'}}>
                        <Text style={styles.inputLabel}>Cidade</Text>       
                        <Input 
                            style={[styles.inputText]} 
                            name="city_pers" 
                            type="text" 
                            onChange={e => Setcity_pers(e.target.value)}
                        />
                    </View>

                    <View style={{width: '30%', marginLeft: '2%'}}>
                        <Text style={styles.inputLabel}>Cep</Text>       
                        <Input 
                            style={styles.inputText} 
                            name="zipcode_pers" 
                            type="text" 
                            onChange={e => Setzipcode_pers(e.target.value)}
                        />
                    </View>
                </View>

                <View style={styles.CidyContainer}>

                    <View style={{width:'41%'}}>
                        <Text style={styles.inputLabel}>Dt Nasc.</Text>

                        <TextInputMask
                            style={styles.inputText} 
                            type={'datetime'}
                            options={{
                                format: 'DD/MM/YYYY'
                            }}
                            value={birth_pers}
                            onChangeText={text => {Setbirth_pers(text)}}
                            />                        
                    </View>

                    <View style={{width:'50%', marginLeft: '9%'}}>
                        <Text style={styles.inputLabel}>CPF</Text>       
                        <Input 
                            style={[styles.inputText]} 
                            name="cpf_pers" 
                            type="text" 
                            onChange={e => Setcpf_pers(e.target.value)
                            }
                        />
                    </View>
                </View>

                <View style={styles.CidyContainer}>
                    <View style={{width:'41%'}}>
                        <Text style={styles.inputLabel}>RG</Text>       
                        <Input 
                            style={[styles.inputText]} 
                            name="rg_pers" 
                            type="text"
                            onChange={e => Setrg_pers(e.target.value)}
                        />
                    </View>

                    <View style={{width:'50%', marginLeft: '9%'}}>
                        <Text style={styles.inputLabel}>Fone/Wats</Text>       
                        <Input 
                            style={[styles.inputText]} 
                            name="phonewhats_pers" 
                            type="text"
                            onChange={e => Setphonewhats_pers(e.target.value)}
                        />
                    </View>
                </View>

                <Text style={styles.inputLabel}>Observações</Text>       
                <Input 
                    style={styles.inputText} 
                    name="comments_pers" 
                    type="text"
                    onChange={e => Setcomments_pers(e.target.value)}
                />

                <Button title="Gravar" onPress={() => formRef.current.submitForm()} />
            </Form>
        </View>
    </ScrollView>
  );
}
 