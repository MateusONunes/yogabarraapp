import React, { useState, useEffect } from 'react';
import { useNavigation } from '@react-navigation/native';
import { View, FlatList, Image, Text, TouchableOpacity, StyleSheet } from 'react-native';

import api from '../services/api';
import img from '../../assets/splash.png';

export default function Incidents() {
  const navigation = useNavigation();

  function navigateToDetail(code_pers) {
    navigation.navigate('Student', { code_pers });
  }
  

  const [pers_pers, setPers_pers] = useState([]);
  const [total, setTotal] = useState(0);

  const [page, setPage] = useState(1);
  const [loading, setLoading] = useState(false);


  async function loadPers_pers() {
    console.log('fff')
    if (loading) {
      return;
    }

    console.log('g')

    if (total > 0 && pers_pers.length === total) {
      return;
    }

    setLoading(true);
    console.log('h')

    const response = await api.get('routesquerystudent', {
      params: { page }
    });

    console.log('i')

    setPers_pers([...pers_pers, ...response.data]);
    setTotal(response.headers['x-total-count']);
    setPage(page + 1);
    setLoading(false);
  }

  useEffect(() => {
    loadPers_pers();
  }, []);
 
  return (
    <View style={{flex: 1}}>
      <Image source={img} />
      <View style={styles.header}>
        <Text style={styles.headerText}>
          Lista de Alunos
        </Text>
      </View>

      <FlatList
        data={pers_pers}
        style={styles.flatlist}
        keyExtractor={pers_pers => String(pers_pers.id)}
        // showsVerticalScrollIndicator={false}
        onEndReached={loadPers_pers}
        onEndReachedThreshold={0.2}
        renderItem={({ item: pers_pers }) => (
          <View style={styles.containerflatlist0}>
            <View style={styles.containerflatlist}>
            <Text>{pers_pers.name_pers}</Text>
            <Text>{pers_pers.address_pers}</Text>

            </View>
            <View style= {styles.detailPerson}>
              <TouchableOpacity 
                  style={styles.detailsButton} 
                  onPress={() => navigation.navigate('Student', { code_pers: pers_pers.code_pers })}
              >
                <Text style= {styles.textPerson}>Ver</Text>
              </TouchableOpacity>


            </View>
          </View>
        )}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  flatlist: {
    marginTop: 32,  
  },
  header: {
    height: 20
    
  },
  headerText: {
    textAlign: "center",
    fontSize: 20,
    paddingVertical: 10,
    fontWeight: "bold"
  },
  containerflatlist0: {
    flex: 1, 
    flexDirection: 'row',
    marginBottom: 3,
    padding: 3,
    backgroundColor: "#f48cff"
    
  },
  containerflatlist: {
    flex:1,

  },
  detailsButton: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center'
  },
  detailsButtonText: {
    color: '#e02041',
    fontSize: 15,
    fontWeight: 'bold'
  },  
  detailPerson: {
    backgroundColor:"#aaa", 
    width: 30, 
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#ad03fc"
  },
  textPerson: {
    color: "#fff",
    justifyContent: "center",
    textDecorationLine: 'underline'
  }
})