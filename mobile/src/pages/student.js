import React, {useRef, useState} from 'react';
import { useNavigation } from '@react-navigation/native';
import {Button, Text, View, TextInput, ScrollView, Image, Alert} from 'react-native';
//import Input from './components/Form/Input';
import {TextInputMask} from 'react-native-masked-text';

import styles from './studentStyle';
import globalstyle from './globalstyle';
import img from '../../assets/splash.png';
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
  const navigation = useNavigation();

  console.log('x--')

  const [name_pers, Setname_pers] = useState('');
  const [address_pers, Setaddress_pers] = useState('');
  const [city_pers, Setcity_pers] = useState('');
  const [zipcode_pers, Setzipcode_pers] = useState('');
  const [birth_pers, Setbirth_pers] = useState('');
  const [cpf_pers, Setcpf_pers] = useState('');
  const [rg_pers, Setrg_pers] = useState('');
  const [phonewhats_pers, Setphonewhats_pers] = useState('');
  const [comments_pers, Setcomments_pers] = useState('');

  const onSave = () => {
    Alert("x")
    console.log('x')

    const data = {
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
      const response = api.post('routes_newstudent', data);

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
          <TextInput
            style={styles.inputText}
            name="name_pers"
            type="text"
            MaskedInput
            placeholder="Nome"
            onChange={e => Setname_pers(e.target.value)}
          />

          <TextInput
            style={styles.inputText}
            name="address_pers"
            type="email"
            placeholder="Endereço"
            onChange={e => Setaddress_pers(e.target.value)}
          />

          <View style={styles.CidyContainer}>
            <View style={{width: '68%'}}>
              <TextInput
                style={[styles.inputText]}
                name="city_pers"
                type="text"
                placeholder="Cidade"
                onChange={e => Setcity_pers(e.target.value)}
              />
            </View>

            <View style={{width: '30%', marginLeft: '2%'}}>
              <TextInput
                style={styles.inputText}
                name="zipcode_pers"
                type="text"
                placeholder="CEP"
                onChange={e => Setzipcode_pers(e.target.value)}
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
                type="text"
                placeholder="CPF"
                onChange={e => Setcpf_pers(e.target.value)}
              />
            </View>
          </View>

          <View style={styles.CidyContainer}>
            <View style={{width: '41%'}}>
              <TextInput
                style={[styles.inputText]}
                name="rg_pers"
                type="text"
                placeholder="RG"
                onChange={e => Setrg_pers(e.target.value)}
              />
            </View>

            <View style={{width: '50%', marginLeft: '9%'}}>
              <TextInput
                style={[styles.inputText]}
                name="phonewhats_pers"
                type="text"
                placeholder="Fone/Wats"
                onChange={e => Setphonewhats_pers(e.target.value)}
              />
            </View>
          </View>

          <TextInput
            style={styles.inputText}
            name="comments_pers"
            type="text"
            placeholder="Observações"
            onChange={e => Setcomments_pers(e.target.value)}
          />
        </View>
        <View>
          <Button 
            title="Gravar" 
            onPress={() => {
              isValid() && onSave();
            }} />

          <Button 
            title="Voltar" 
            onPress={() => navigation.navigate("Initial")}
            />

        </View>
      </View>
    </View>
  );
}
