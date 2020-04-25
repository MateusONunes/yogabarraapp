import React, {useRef, useState, useEffect} from 'react';
import { useNavigation, useRoute } from '@react-navigation/native';
import {Button, StyleSheet, View, TextInput, ScrollView, Image, Alert} from 'react-native';
//import Input from './components/Form/Input';
import {TextInputMask} from 'react-native-masked-text';

import globalstyle from './globalstyle';
import img from '../../assets/splash.png';
import api from '../services/api';

export default function Student() {
  console.log('aaa')
  const navigation = useNavigation();
  const route = useRoute();
  
  let code_pers = route.params.code_pers

  //console.log('code_pers', code_pers)

  const [name_pers, Setname_pers] = useState('');
  const [address_pers, Setaddress_pers] = useState('');
  const [city_pers, Setcity_pers] = useState('');
  const [zipcode_pers, Setzipcode_pers] = useState('');
  const [birth_pers, Setbirth_pers] = useState('');
  const [cpf_pers, Setcpf_pers] = useState('');
  const [rg_pers, Setrg_pers] = useState('');
  const [phonewhats_pers, Setphonewhats_pers] = useState('');
  const [comments_pers, Setcomments_pers] = useState('');

  let person_pers = []


  async function loadPers_pers(){
    const response = await api.get('routesquerystudent', {
      params: { code_pers }
    });

    person_pers = response.data[0]
    Setname_pers(person_pers.name_pers)
    Setaddress_pers(person_pers.address_pers)
    Setcity_pers(person_pers.city_pers)
    Setzipcode_pers(person_pers.zipcode_pers)
    Setbirth_pers(person_pers.birth_pers)
    Setcpf_pers(person_pers.cpf_pers)
    Setrg_pers(person_pers.rg_pers)
    Setphonewhats_pers(person_pers.phonewhats_pers)
    Setcomments_pers(person_pers.comments_pers)
  }

  if (code_pers != 0) {
    useEffect(() => {
      loadPers_pers();
    }, []);
  }

  const onSave = () => {
    const data = {
      code_pers,
      name_pers,
      address_pers,
      city_pers,
      zipcode_pers,
      birth_pers,
      cpf_pers,
      rg_pers,
      phonewhats_pers,
      comments_pers,
    };

    try {
      const response = api.post('routesnewstudent', data);

      alert(`Seu ID de acesso: ${response.data.id}`);
    } catch (err) {
      alert('Erro no cadastro, tente novamente.');
    }
  }

  const onDelete = () => {
    console.log('Del')
    try {
      const response = api.post('routesdeletestudent', {code_pers});

      alert(`Seu ID de acesso: ${response.data.id}`);
    } catch (err) {
      alert('Erro no cadastro, tente novamente.');
    }
  }
  


  return (
    <View style={{flex: 1}}>
      <Image source={img} />
      <View style={{flex: 1}}>
        <View style={styles.forms}>
          <ScrollView>
            <TextInput
              style={styles.inputText}
              name="name_pers"
              value={name_pers}
              type="text"
              placeholder="Nome"
              onChangeText={text => Setname_pers(text)}
            />

            <TextInput
              style={styles.inputText}
              name="address_pers"
              value={address_pers}
              type="email"
              placeholder="Endereço"
              onChangeText={text => Setaddress_pers(text)}
            />

            <View style={styles.CidyContainer}>
              <View style={{width: '68%'}}>
                <TextInput
                  style={[styles.inputText]}
                  name="city_pers"
                  value={city_pers}
                  type="text"
                  placeholder="Cidade"
                  onChangeText={text => Setcity_pers(text)}
                />
              </View>

              <View style={{width: '30%', marginLeft: '2%'}}>
                <TextInput
                  style={styles.inputText}
                  name="zipcode_pers"
                  value={zipcode_pers}
                  type="text"
                  placeholder="CEP"
                  onChangeText={text => Setzipcode_pers(text)}
                />
              </View>
            </View>

            <View style={styles.CidyContainer}>
              <View style={{width: '41%'}}>
                <TextInputMask
                  style={styles.inputText}
                  placeholder="Dt Nascimento"
                  type={'datetime'}
                  options={{
                    format: 'DD/MM/YYYY',
                  }}
                  value={birth_pers}
                  onChangeText={text => {
                    Setbirth_pers(text);
                  }}
                />
              </View>

              <View style={{width: '50%', marginLeft: '9%'}}>
                <TextInput
                  style={[styles.inputText]}
                  name="cpf_pers"
                  value={cpf_pers}
                  type="text"
                  placeholder="CPF"
                  onChangeText={text => Setcpf_pers(text)}
                />
              </View>
            </View>

            <View style={styles.CidyContainer}>
              <View style={{width: '41%'}}>
                <TextInput
                  style={[styles.inputText]}
                  name="rg_pers"
                  value={rg_pers}
                  type="text"
                  placeholder="RG"
                  onChangeText={text => Setrg_pers(text)}
                />
              </View>

              <View style={{width: '50%', marginLeft: '9%'}}>
                <TextInput
                  style={[styles.inputText]}
                  name="phonewhats_pers"
                  value={phonewhats_pers}
                  type="text"
                  placeholder="Fone/Wats"
                  onChangeText={text => Setphonewhats_pers(text)}
                />
              </View>
            </View>

            <TextInput
              style={styles.inputText}
              name="comments_pers"
              value={comments_pers}
              type="text"
              placeholder="Observações"
              onChangeText={text => Setcomments_pers(text)}
              phonewhats
            />
          </ScrollView>
          
        </View>
        <View style={styles.footerbuttoncontainer}>
          <Button  
            style = {styles.footerbutton}
            title="Gravar" 
            onPress={() => onSave()} 
          />

          <Button  
            style = {styles.footerbutton}
            title="Excluir" 
            onPress={() => onDelete()} 
          />

          <Button 
            style ={styles.footerbutton}
            title="<< Voltar" 
            onPress={() => navigation.navigate("Initial")}
            />

        </View>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  inputText: {
    borderStyle: 'solid',
    fontSize: 20,
    borderWidth: 1,
    borderRadius: 4,
    borderColor: '#4a2dad',
    marginBottom: 10
  },
  inputLabel: {
    marginTop: 8,
  },
  forms: {
    flex: 1,
    paddingTop: 16,
    paddingHorizontal: 5,
    backgroundColor: '#c0b0f7',
  },
  CidyContainer: {
    display: 'flex',
    flexDirection: 'row',
    alignContent: 'space-between',
  },
  footerbutton: {
    margin:10,
    width: 200,
    height: 30,
    backgroundColor: '#fff'
  },
  footerbuttoncontainer: {
    flexDirection: 'row',
    justifyContent: "space-around"
  }
});
